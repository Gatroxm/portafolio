# 🚀 AWS DEPLOYMENT - Portafolio Gustavo Muñoz
# Script especializado para deploy a AWS S3 + CloudFront

param(
    [string]$BucketName = "",
    [string]$Region = "us-east-1",
    [string]$CloudFrontId = "",
    [switch]$SetupInfrastructure,
    [switch]$Help
)

function Write-Header {
    Write-Host "╔══════════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
    Write-Host "║                     ☁️ AWS DEPLOYMENT                            ║" -ForegroundColor Cyan
    Write-Host "║                   Gustavo Muñoz Portfolio                        ║" -ForegroundColor Cyan
    Write-Host "╚══════════════════════════════════════════════════════════════════╝" -ForegroundColor Cyan
    Write-Host ""
}

function Show-Help {
    Write-Host "📋 USO DEL SCRIPT AWS:" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "  .\aws-deploy.ps1                                    # Configuración interactiva" -ForegroundColor White
    Write-Host "  .\aws-deploy.ps1 -BucketName 'mi-portfolio'         # Deploy directo" -ForegroundColor White
    Write-Host "  .\aws-deploy.ps1 -SetupInfrastructure              # Crear infraestructura" -ForegroundColor White
    Write-Host "  .\aws-deploy.ps1 -BucketName 'mi-portfolio' -CloudFrontId 'E123456789' # Con CDN" -ForegroundColor White
    Write-Host ""
    Write-Host "🎯 CONFIGURACIÓN REQUERIDA:" -ForegroundColor Yellow
    Write-Host "  1. AWS CLI instalado y configurado" -ForegroundColor Green
    Write-Host "  2. Credenciales AWS con permisos S3/CloudFront" -ForegroundColor Green
    Write-Host "  3. Bucket S3 creado (o usar -SetupInfrastructure)" -ForegroundColor Green
    Write-Host ""
}

function Test-AWSPrerequisites {
    Write-Host "🔍 Verificando prerrequisitos de AWS..." -ForegroundColor Blue
    Write-Host ""
    
    # AWS CLI
    if (Get-Command "aws" -ErrorAction SilentlyContinue) {
        $awsVersion = aws --version 2>$null
        Write-Host "✅ AWS CLI - $awsVersion" -ForegroundColor Green
    }
    else {
        Write-Host "❌ AWS CLI no está instalado" -ForegroundColor Red
        Write-Host "📥 Instalar desde: https://aws.amazon.com/cli/" -ForegroundColor Cyan
        return $false
    }
    
    # Credenciales AWS
    $awsIdentity = aws sts get-caller-identity 2>$null | ConvertFrom-Json -ErrorAction SilentlyContinue
    if ($awsIdentity) {
        Write-Host "✅ Credenciales AWS configuradas" -ForegroundColor Green
        Write-Host "   👤 Usuario: $($awsIdentity.UserId)" -ForegroundColor Gray
        Write-Host "   🏢 Cuenta: $($awsIdentity.Account)" -ForegroundColor Gray
    }
    else {
        Write-Host "❌ Credenciales AWS no configuradas" -ForegroundColor Red
        Write-Host "🔧 Configura con: aws configure" -ForegroundColor Cyan
        return $false
    }
    
    return $true
}

function New-S3Bucket {
    param([string]$BucketName, [string]$Region)
    
    Write-Host "🪣 Creando bucket S3: $BucketName..." -ForegroundColor Blue
    
    # Crear bucket
    if ($Region -eq "us-east-1") {
        aws s3 mb s3://$BucketName
    }
    else {
        aws s3 mb s3://$BucketName --region $Region
    }
    
    if ($LASTEXITCODE -ne 0) {
        Write-Host "   ❌ Error creando bucket" -ForegroundColor Red
        return $false
    }
    
    # Configurar como sitio web estático
    Write-Host "   🌐 Configurando hosting estático..." -ForegroundColor Yellow
    
    $websiteConfig = @{
        IndexDocument = @{ Suffix = "index.html" }
        ErrorDocument = @{ Key = "index.html" }
    } | ConvertTo-Json -Compress
    
    aws s3api put-bucket-website --bucket $BucketName --website-configuration $websiteConfig
    
    # Configurar política de bucket público
    $bucketPolicy = @"
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::$BucketName/*"
        }
    ]
}
"@
    
    $bucketPolicy | aws s3api put-bucket-policy --bucket $BucketName --policy file:///dev/stdin
    
    Write-Host "   ✅ Bucket configurado correctamente" -ForegroundColor Green
    return $true
}

function Deploy-ToS3 {
    param([string]$BucketName)
    
    Write-Host "📤 Desplegando a S3: $BucketName..." -ForegroundColor Blue
    
    # Verificar que existe el directorio dist
    if (-not (Test-Path "dist")) {
        Write-Host "❌ Directorio 'dist' no encontrado. Ejecuta 'npm run build' primero" -ForegroundColor Red
        return $false
    }
    
    # Sync con S3
    Write-Host "   📁 Sincronizando archivos..." -ForegroundColor Yellow
    aws s3 sync dist/ s3://$BucketName --delete --exact-timestamps
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "   ✅ Archivos subidos correctamente" -ForegroundColor Green
        return $true
    }
    else {
        Write-Host "   ❌ Error subiendo archivos" -ForegroundColor Red
        return $false
    }
}

function Update-CloudFrontDistribution {
    param([string]$CloudFrontId)
    
    if ([string]::IsNullOrWhiteSpace($CloudFrontId)) {
        return $true
    }
    
    Write-Host "🌎 Invalidando caché de CloudFront..." -ForegroundColor Blue
    
    $invalidationId = aws cloudfront create-invalidation --distribution-id $CloudFrontId --paths "/*" --query 'Invalidation.Id' --output text
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "   ✅ Invalidación creada: $invalidationId" -ForegroundColor Green
        Write-Host "   ⏱️ La propagación puede tomar 5-15 minutos" -ForegroundColor Yellow
        return $true
    }
    else {
        Write-Host "   ❌ Error invalidando caché" -ForegroundColor Red
        return $false
    }
}

function Show-DeploymentInfo {
    param([string]$BucketName, [string]$CloudFrontId)
    
    Write-Host ""
    Write-Host "🎉 ¡DEPLOYMENT COMPLETADO!" -ForegroundColor Green
    Write-Host ""
    Write-Host "📊 Información del despliegue:" -ForegroundColor Cyan
    Write-Host "   🪣 Bucket S3: $BucketName" -ForegroundColor White
    Write-Host "   🌐 URL S3: http://$BucketName.s3-website-$Region.amazonaws.com" -ForegroundColor White
    
    if (-not [string]::IsNullOrWhiteSpace($CloudFrontId)) {
        $cloudfrontUrl = aws cloudfront get-distribution --id $CloudFrontId --query 'Distribution.DomainName' --output text 2>$null
        if ($cloudfrontUrl) {
            Write-Host "   ☁️ CloudFront: https://$cloudfrontUrl" -ForegroundColor White
        }
    }
    
    Write-Host ""
    Write-Host "🔗 Próximos pasos:" -ForegroundColor Yellow
    Write-Host "   • Configura un dominio personalizado (opcional)" -ForegroundColor Gray
    Write-Host "   • Configura certificado SSL en CloudFront" -ForegroundColor Gray
    Write-Host "   • Configura CI/CD para deploys automáticos" -ForegroundColor Gray
}

# EJECUCIÓN PRINCIPAL
Write-Header

if ($Help) {
    Show-Help
    exit 0
}

# Verificar prerrequisitos
if (-not (Test-AWSPrerequisites)) {
    Write-Host ""
    Write-Host "❌ Prerrequisitos no cumplidos. Deployment cancelado." -ForegroundColor Red
    exit 1
}

Write-Host ""

# Setup de infraestructura si se solicita
if ($SetupInfrastructure) {
    if ([string]::IsNullOrWhiteSpace($BucketName)) {
        $BucketName = Read-Host "🪣 Ingresa el nombre para el nuevo bucket S3"
    }
    
    if ([string]::IsNullOrWhiteSpace($BucketName)) {
        Write-Host "❌ Nombre de bucket requerido" -ForegroundColor Red
        exit 1
    }
    
    $setupSuccess = New-S3Bucket -BucketName $BucketName -Region $Region
    if (-not $setupSuccess) {
        exit 1
    }
    Write-Host ""
}

# Obtener nombre del bucket si no se proporcionó
if ([string]::IsNullOrWhiteSpace($BucketName)) {
    Write-Host "🪣 Buckets S3 disponibles:" -ForegroundColor Cyan
    aws s3 ls
    Write-Host ""
    
    $BucketName = Read-Host "Ingresa el nombre del bucket S3 para el deploy"
    
    if ([string]::IsNullOrWhiteSpace($BucketName)) {
        Write-Host "❌ Nombre de bucket requerido" -ForegroundColor Red
        exit 1
    }
}

# Verificar que el bucket existe
$bucketExists = aws s3 ls "s3://$BucketName" 2>$null
if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Bucket '$BucketName' no existe o no tienes acceso" -ForegroundColor Red
    $createBucket = Read-Host "¿Crear el bucket? (y/N)"
    if ($createBucket -eq "y" -or $createBucket -eq "Y") {
        $setupSuccess = New-S3Bucket -BucketName $BucketName -Region $Region
        if (-not $setupSuccess) {
            exit 1
        }
    }
    else {
        exit 1
    }
}

# Build del proyecto
Write-Host "🔨 Construyendo proyecto..." -ForegroundColor Blue
npm run build

if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Error en el build" -ForegroundColor Red
    exit 1
}

Write-Host ""

# Deploy a S3
$deploySuccess = Deploy-ToS3 -BucketName $BucketName

if (-not $deploySuccess) {
    exit 1
}

# Invalidar CloudFront si se proporcionó
if (-not [string]::IsNullOrWhiteSpace($CloudFrontId)) {
    Write-Host ""
    Update-CloudFrontDistribution -CloudFrontId $CloudFrontId
}

# Mostrar información del deployment
Show-DeploymentInfo -BucketName $BucketName -CloudFrontId $CloudFrontId

Write-Host ""
Write-Host "📞 Soporte: tavoxpau@gmail.com" -ForegroundColor Cyan