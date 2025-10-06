# 🚀 DEPLOY PORTAFOLIO - Gustavo Muñoz
# Script para deployment del portafolio Vue.js a diferentes plataformas

param(
    [string]$Platform = "",
    [string]$Environment = "production",
    [switch]$BuildOnly,
    [switch]$Help
)

# Configuración de colores
$ErrorActionPreference = "Continue"

function Write-Banner {
    Clear-Host
    Write-Host "╔══════════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
    Write-Host "║                 🎯 PORTFOLIO DEPLOYMENT SCRIPT                   ║" -ForegroundColor Cyan  
    Write-Host "║                     Gustavo Muñoz                            ║" -ForegroundColor Cyan
    Write-Host "╚══════════════════════════════════════════════════════════════════╝" -ForegroundColor Cyan
    Write-Host ""
}

function Show-Help {
    Write-Host "📋 USO DEL SCRIPT:" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "  .\deploy.ps1                    # Menú interactivo" -ForegroundColor White
    Write-Host "  .\deploy.ps1 -Platform aws      # Deploy directo a AWS" -ForegroundColor White
    Write-Host "  .\deploy.ps1 -Platform netlify  # Deploy directo a Netlify" -ForegroundColor White
    Write-Host "  .\deploy.ps1 -Platform vercel   # Deploy directo a Vercel" -ForegroundColor White
    Write-Host "  .\deploy.ps1 -Platform github   # Deploy a GitHub Pages" -ForegroundColor White
    Write-Host "  .\deploy.ps1 -BuildOnly         # Solo build sin deploy" -ForegroundColor White
    Write-Host "  .\deploy.ps1 -Help              # Mostrar esta ayuda" -ForegroundColor White
    Write-Host ""
    Write-Host "🎯 PLATAFORMAS SOPORTADAS:" -ForegroundColor Yellow
    Write-Host "  • aws      - Amazon S3 + CloudFront" -ForegroundColor Green
    Write-Host "  • netlify  - Netlify (Recomendado)" -ForegroundColor Green
    Write-Host "  • vercel   - Vercel" -ForegroundColor Green
    Write-Host "  • github   - GitHub Pages" -ForegroundColor Green
    Write-Host ""
}

function Test-Prerequisites {
    Write-Host "🔍 Verificando prerrequisitos..." -ForegroundColor Blue
    Write-Host ""
    
    $missing = @()
    
    # Node.js
    if (Get-Command "node" -ErrorAction SilentlyContinue) {
        $nodeVersion = node --version
        Write-Host "✅ Node.js - $nodeVersion" -ForegroundColor Green
    }
    else {
        Write-Host "❌ Node.js - No instalado" -ForegroundColor Red
        $missing += "Node.js"
    }
    
    # NPM
    if (Get-Command "npm" -ErrorAction SilentlyContinue) {
        $npmVersion = npm --version
        Write-Host "✅ NPM - v$npmVersion" -ForegroundColor Green
    }
    else {
        Write-Host "❌ NPM - No instalado" -ForegroundColor Red
        $missing += "NPM"
    }
    
    # Git
    if (Get-Command "git" -ErrorAction SilentlyContinue) {
        Write-Host "✅ Git - Instalado" -ForegroundColor Green
    }
    else {
        Write-Host "❌ Git - No instalado" -ForegroundColor Red
        $missing += "Git"
    }
    
    if ($missing.Count -gt 0) {
        Write-Host ""
        Write-Host "⚠️ Faltan los siguientes prerrequisitos:" -ForegroundColor Red
        $missing | ForEach-Object { Write-Host "   • $_" -ForegroundColor Red }
        return $false
    }
    
    Write-Host ""
    Write-Host "🎉 Todos los prerrequisitos están instalados!" -ForegroundColor Green
    return $true
}

function Install-Dependencies {
    Write-Host "📦 Verificando dependencias..." -ForegroundColor Blue
    
    if (-not (Test-Path "node_modules")) {
        Write-Host "   📥 Instalando dependencias..." -ForegroundColor Yellow
        npm install --silent
        if ($LASTEXITCODE -eq 0) {
            Write-Host "   ✅ Dependencias instaladas" -ForegroundColor Green
        }
        else {
            Write-Host "   ❌ Error instalando dependencias" -ForegroundColor Red
            return $false
        }
    }
    else {
        Write-Host "   ✅ Dependencias ya instaladas" -ForegroundColor Green
    }
    return $true
}

function Build-Portfolio {
    Write-Host "🔨 Construyendo portafolio..." -ForegroundColor Blue
    Write-Host ""
    
    # Limpiar dist anterior
    if (Test-Path "dist") {
        Remove-Item -Recurse -Force "dist"
        Write-Host "   🧹 Carpeta dist limpia" -ForegroundColor Gray
    }
    
    # Ejecutar build
    npm run build
    
    if ($LASTEXITCODE -eq 0 -and (Test-Path "dist")) {
        Write-Host ""
        Write-Host "   ✅ Build completado exitosamente" -ForegroundColor Green
        
        # Mostrar estadísticas del build
        $distSize = (Get-ChildItem -Recurse "dist" | Measure-Object -Property Length -Sum).Sum / 1MB
        Write-Host "   📊 Tamaño del build: $([math]::Round($distSize, 2)) MB" -ForegroundColor Gray
        
        return $true
    }
    else {
        Write-Host ""
        Write-Host "   ❌ Error en el build" -ForegroundColor Red
        return $false
    }
}

function Deploy-ToAWS {
    Write-Host "☁️ Desplegando a AWS S3..." -ForegroundColor Blue
    Write-Host ""
    
    # Verificar AWS CLI
    if (-not (Get-Command "aws" -ErrorAction SilentlyContinue)) {
        Write-Host "❌ AWS CLI no está instalado" -ForegroundColor Red
        Write-Host "📥 Instalar desde: https://aws.amazon.com/cli/" -ForegroundColor Cyan
        return $false
    }
    
    # Configurar bucket (esto debería ser configurado previamente)
    $bucketName = Read-Host "🪣 Ingresa el nombre de tu bucket S3"
    
    if ([string]::IsNullOrWhiteSpace($bucketName)) {
        Write-Host "❌ Nombre de bucket requerido" -ForegroundColor Red
        return $false
    }
    
    Write-Host "   📤 Subiendo archivos a S3..." -ForegroundColor Yellow
    aws s3 sync dist/ s3://$bucketName --delete --exact-timestamps
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "   ✅ Deploy a AWS completado" -ForegroundColor Green
        Write-Host "   🌐 URL: https://$bucketName.s3-website-us-east-1.amazonaws.com" -ForegroundColor Cyan
        return $true
    }
    else {
        Write-Host "   ❌ Error en deploy a AWS" -ForegroundColor Red
        return $false
    }
}

function Deploy-ToNetlify {
    Write-Host "🌐 Desplegando a Netlify..." -ForegroundColor Blue
    Write-Host ""
    
    # Verificar Netlify CLI
    if (-not (Get-Command "netlify" -ErrorAction SilentlyContinue)) {
        Write-Host "📥 Instalando Netlify CLI..." -ForegroundColor Yellow
        npm install -g netlify-cli
    }
    
    Write-Host "   📤 Desplegando a Netlify..." -ForegroundColor Yellow
    netlify deploy --prod --dir=dist
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "   ✅ Deploy a Netlify completado" -ForegroundColor Green
        return $true
    }
    else {
        Write-Host "   ❌ Error en deploy a Netlify" -ForegroundColor Red
        return $false
    }
}

function Deploy-ToVercel {
    Write-Host "▲ Desplegando a Vercel..." -ForegroundColor Blue
    Write-Host ""
    
    # Verificar Vercel CLI
    if (-not (Get-Command "vercel" -ErrorAction SilentlyContinue)) {
        Write-Host "📥 Instalando Vercel CLI..." -ForegroundColor Yellow
        npm install -g vercel
    }
    
    Write-Host "   📤 Desplegando a Vercel..." -ForegroundColor Yellow
    vercel --prod
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "   ✅ Deploy a Vercel completado" -ForegroundColor Green
        return $true
    }
    else {
        Write-Host "   ❌ Error en deploy a Vercel" -ForegroundColor Red
        return $false
    }
}

function Deploy-ToGitHubPages {
    Write-Host "🐙 Desplegando a GitHub Pages..." -ForegroundColor Blue
    Write-Host ""
    
    # Verificar si es un repo de Git
    if (-not (Test-Path ".git")) {
        Write-Host "❌ No es un repositorio Git" -ForegroundColor Red
        return $false
    }
    
    # Verificar si tiene remote origin
    $remotes = git remote -v 2>$null
    if (-not $remotes) {
        Write-Host "❌ No hay remote origin configurado" -ForegroundColor Red
        return $false
    }
    
    # Deploy usando gh-pages
    Write-Host "   📦 Instalando gh-pages..." -ForegroundColor Yellow
    npm install --save-dev gh-pages
    
    Write-Host "   📤 Desplegando a GitHub Pages..." -ForegroundColor Yellow
    npx gh-pages -d dist
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "   ✅ Deploy a GitHub Pages completado" -ForegroundColor Green
        $repoUrl = git config --get remote.origin.url
        $username = ($repoUrl -split '/')[3]
        $repoName = ($repoUrl -split '/')[-1] -replace '\.git$', ''
        Write-Host "   🌐 URL: https://$username.github.io/$repoName" -ForegroundColor Cyan
        return $true
    }
    else {
        Write-Host "   ❌ Error en deploy a GitHub Pages" -ForegroundColor Red
        return $false
    }
}

function Show-InteractiveMenu {
    Write-Host "🎯 Selecciona la plataforma de deploy:" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "1. 🌐 Netlify (Recomendado - Fácil y rápido)" -ForegroundColor Green
    Write-Host "2. ▲  Vercel (Excelente para proyectos Vue/React)" -ForegroundColor Green
    Write-Host "3. ☁️  AWS S3 (Control total, requiere configuración)" -ForegroundColor Yellow
    Write-Host "4. 🐙 GitHub Pages (Gratis con GitHub)" -ForegroundColor Green
    Write-Host "5. 🔨 Solo Build (Sin deploy)" -ForegroundColor Blue
    Write-Host "6. 🚀 Build + Preview local" -ForegroundColor Blue
    Write-Host "0. ❌ Salir" -ForegroundColor Red
    Write-Host ""
    
    $choice = Read-Host "Selecciona una opción (0-6)"
    
    switch ($choice) {
        "1" { return "netlify" }
        "2" { return "vercel" }
        "3" { return "aws" }
        "4" { return "github" }
        "5" { return "build-only" }
        "6" { return "preview" }
        "0" { return "exit" }
        default { 
            Write-Host "❌ Opción no válida" -ForegroundColor Red
            return $null 
        }
    }
}

# EJECUCIÓN PRINCIPAL
Write-Banner

if ($Help) {
    Show-Help
    exit 0
}

# Verificar prerrequisitos
if (-not (Test-Prerequisites)) {
    exit 1
}

Write-Host ""

# Instalar dependencias
if (-not (Install-Dependencies)) {
    exit 1
}

Write-Host ""

# Determinar plataforma
if ([string]::IsNullOrWhiteSpace($Platform)) {
    $Platform = Show-InteractiveMenu
    
    if ($null -eq $Platform) {
        Write-Host "❌ Opción no válida. Intenta de nuevo." -ForegroundColor Red
        exit 1
    }
}

if ($Platform -eq "exit") {
    Write-Host "👋 ¡Hasta luego!" -ForegroundColor Green
    exit 0
}

Write-Host ""

# Build del proyecto
$buildSuccess = Build-Portfolio

if (-not $buildSuccess) {
    Write-Host "❌ Error en el build. Deploy cancelado." -ForegroundColor Red
    exit 1
}

if ($BuildOnly -or $Platform -eq "build-only") {
    Write-Host ""
    Write-Host "🎉 Build completado. Archivos listos en ./dist/" -ForegroundColor Green
    exit 0
}

if ($Platform -eq "preview") {
    Write-Host ""
    Write-Host "👀 Iniciando preview local..." -ForegroundColor Magenta
    Write-Host "🌐 Disponible en: http://localhost:4173" -ForegroundColor Cyan
    npm run preview
    exit 0
}

Write-Host ""

# Deploy según plataforma
$deploySuccess = $false

switch ($Platform.ToLower()) {
    "aws" { $deploySuccess = Deploy-ToAWS }
    "netlify" { $deploySuccess = Deploy-ToNetlify }
    "vercel" { $deploySuccess = Deploy-ToVercel }
    "github" { $deploySuccess = Deploy-ToGitHubPages }
    default {
        Write-Host "❌ Plataforma '$Platform' no soportada" -ForegroundColor Red
        Show-Help
        exit 1
    }
}

# Resultado final
Write-Host ""
if ($deploySuccess) {
    Write-Host "🎉 ¡DEPLOY COMPLETADO EXITOSAMENTE!" -ForegroundColor Green
    Write-Host ""
    Write-Host "✅ Portafolio desplegado en $($Platform.ToUpper())" -ForegroundColor Green
    Write-Host "🚀 Los cambios pueden tardar unos minutos en propagarse" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "📊 Próximos pasos:" -ForegroundColor Cyan
    Write-Host "   • Verifica que el sitio carga correctamente" -ForegroundColor Gray
    Write-Host "   • Actualiza el README con la nueva URL" -ForegroundColor Gray
    Write-Host "   • Comparte tu portafolio en redes sociales" -ForegroundColor Gray
}
else {
    Write-Host "❌ Error en el deploy a $($Platform.ToUpper())" -ForegroundColor Red
    Write-Host ""
    Write-Host "🔧 Soluciones sugeridas:" -ForegroundColor Yellow
    Write-Host "   • Verifica tu configuración de la plataforma" -ForegroundColor Gray
    Write-Host "   • Revisa los logs de error arriba" -ForegroundColor Gray
    Write-Host "   • Intenta con otra plataforma" -ForegroundColor Gray
    exit 1
}

Write-Host ""
Write-Host "📞 Contacto: tavoxpau@gmail.com" -ForegroundColor Cyan
Write-Host "🐙 GitHub: https://github.com/Gatroxm" -ForegroundColor Cyan