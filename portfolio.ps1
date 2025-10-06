# 🚀 PORTFOLIO COMPLETE DEPLOYMENT
# Script unificado para el portafolio completo de Gabriel Troncoso

param(
    [ValidateSet("dev", "build", "deploy-netlify", "deploy-vercel", "deploy-aws", "deploy-github", "full-deploy")]
    [string]$Action = "",
    [string]$Platform = "",
    [switch]$Help
)

function Show-Welcome {
    Clear-Host
    Write-Host "╔══════════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
    Write-Host "║                 🎯 GABRIEL TRONCOSO PORTFOLIO                    ║" -ForegroundColor Cyan
    Write-Host "║                      Complete Deployment                        ║" -ForegroundColor Cyan
    Write-Host "║                                                                  ║" -ForegroundColor Cyan
    Write-Host "║  Vue.js 3 + Tailwind + Vite + Multi-Platform Deploy            ║" -ForegroundColor Cyan
    Write-Host "╚══════════════════════════════════════════════════════════════════╝" -ForegroundColor Cyan
    Write-Host ""
}

function Show-Help {
    Write-Host "📋 USO DEL SCRIPT:" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "🔥 COMANDOS RÁPIDOS:" -ForegroundColor Green
    Write-Host "  .\portfolio.ps1 dev               # Iniciar desarrollo" -ForegroundColor White
    Write-Host "  .\portfolio.ps1 build             # Build de producción" -ForegroundColor White
    Write-Host "  .\portfolio.ps1 deploy-netlify    # Deploy a Netlify" -ForegroundColor White
    Write-Host "  .\portfolio.ps1 deploy-vercel     # Deploy a Vercel" -ForegroundColor White
    Write-Host "  .\portfolio.ps1 deploy-aws        # Deploy a AWS S3" -ForegroundColor White
    Write-Host "  .\portfolio.ps1 deploy-github     # Deploy a GitHub Pages" -ForegroundColor White
    Write-Host "  .\portfolio.ps1 full-deploy       # Deploy completo" -ForegroundColor White
    Write-Host ""
    Write-Host "🎯 OTROS SCRIPTS DISPONIBLES:" -ForegroundColor Yellow
    Write-Host "  .\deploy.ps1                      # Deploy avanzado con opciones" -ForegroundColor Gray
    Write-Host "  .\aws-deploy.ps1                  # Deploy especializado para AWS" -ForegroundColor Gray
    Write-Host "  .\master-deploy.ps1               # Deploy de todos los proyectos" -ForegroundColor Gray
    Write-Host "  .\quick-deploy.ps1                # Deploy rápido de proyectos" -ForegroundColor Gray
    Write-Host ""
}

function Test-Environment {
    Write-Host "🔍 Verificando entorno..." -ForegroundColor Blue
    
    $errors = @()
    
    # Node.js
    if (Get-Command "node" -ErrorAction SilentlyContinue) {
        $nodeVersion = node --version
        Write-Host "✅ Node.js $nodeVersion" -ForegroundColor Green
    }
    else {
        $errors += "Node.js no instalado"
    }
    
    # NPM
    if (Get-Command "npm" -ErrorAction SilentlyContinue) {
        $npmVersion = npm --version
        Write-Host "✅ NPM v$npmVersion" -ForegroundColor Green
    }
    else {
        $errors += "NPM no instalado"
    }
    
    # Git
    if (Get-Command "git" -ErrorAction SilentlyContinue) {
        Write-Host "✅ Git instalado" -ForegroundColor Green
    }
    else {
        $errors += "Git no instalado"
    }
    
    # Package.json
    if (Test-Path "package.json") {
        Write-Host "✅ package.json encontrado" -ForegroundColor Green
    }
    else {
        $errors += "package.json no encontrado"
    }
    
    # Vue files
    if (Test-Path "src") {
        Write-Host "✅ Estructura Vue.js encontrada" -ForegroundColor Green
    }
    else {
        $errors += "Estructura Vue.js no encontrada"
    }
    
    if ($errors.Count -gt 0) {
        Write-Host ""
        Write-Host "❌ Errores encontrados:" -ForegroundColor Red
        $errors | ForEach-Object { Write-Host "   • $_" -ForegroundColor Red }
        return $false
    }
    
    Write-Host ""
    return $true
}

function Start-Development {
    Write-Host "🚀 Iniciando servidor de desarrollo..." -ForegroundColor Green
    Write-Host ""
    Write-Host "🌐 El portafolio estará disponible en:" -ForegroundColor Cyan
    Write-Host "   http://localhost:5173" -ForegroundColor White
    Write-Host ""
    Write-Host "⚡ Características activas:" -ForegroundColor Yellow
    Write-Host "   • Hot Module Replacement (HMR)" -ForegroundColor Green
    Write-Host "   • Vue DevTools compatible" -ForegroundColor Green
    Write-Host "   • Tailwind CSS con JIT" -ForegroundColor Green
    Write-Host "   • Responsive design testing" -ForegroundColor Green
    Write-Host ""
    Write-Host "💡 Presiona Ctrl+C para detener" -ForegroundColor Gray
    Write-Host ""
    
    npm run dev
}

function Start-Build {
    Write-Host "🔨 Construyendo para producción..." -ForegroundColor Blue
    Write-Host ""
    
    # Limpiar dist anterior
    if (Test-Path "dist") {
        Remove-Item -Recurse -Force "dist"
        Write-Host "🧹 Directorio dist limpio" -ForegroundColor Gray
    }
    
    # Ejecutar build
    npm run build
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host ""
        Write-Host "✅ Build completado exitosamente!" -ForegroundColor Green
        
        if (Test-Path "dist") {
            $files = Get-ChildItem -Recurse "dist" | Where-Object { -not $_.PSIsContainer }
            $totalSize = ($files | Measure-Object -Property Length -Sum).Sum / 1MB
            
            Write-Host "📊 Estadísticas del build:" -ForegroundColor Cyan
            Write-Host "   📁 Archivos generados: $($files.Count)" -ForegroundColor White
            Write-Host "   📏 Tamaño total: $([math]::Round($totalSize, 2)) MB" -ForegroundColor White
            Write-Host "   📂 Ubicación: ./dist/" -ForegroundColor White
        }
        
        Write-Host ""
        Write-Host "🚀 El build está listo para deploy!" -ForegroundColor Green
        return $true
    }
    else {
        Write-Host ""
        Write-Host "❌ Error en el build" -ForegroundColor Red
        return $false
    }
}

function Show-Menu {
    Write-Host "🎯 ¿Qué quieres hacer con el portafolio?" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "🔧 DESARROLLO:" -ForegroundColor Yellow
    Write-Host "1. 🚀 Iniciar desarrollo (npm run dev)"
    Write-Host "2. 🔨 Build de producción"
    Write-Host "3. 👀 Preview del build"
    Write-Host ""
    Write-Host "☁️ DEPLOYMENT:" -ForegroundColor Yellow
    Write-Host "4. 🌐 Deploy a Netlify (Recomendado)"
    Write-Host "5. ▲  Deploy a Vercel"
    Write-Host "6. ☁️  Deploy a AWS S3"
    Write-Host "7. 🐙 Deploy a GitHub Pages"
    Write-Host ""
    Write-Host "🎯 AVANZADO:" -ForegroundColor Yellow
    Write-Host "8. 🚀 Deploy completo (Build + Deploy + Git)"
    Write-Host "9. 📊 Ver información del proyecto"
    Write-Host "10. 🧹 Limpiar y reinstalar dependencias"
    Write-Host ""
    Write-Host "0. ❌ Salir"
    Write-Host ""
    
    $choice = Read-Host "Selecciona una opción (0-10)"
    
    switch ($choice) {
        "1" { return "dev" }
        "2" { return "build" }
        "3" { return "preview" }
        "4" { return "deploy-netlify" }
        "5" { return "deploy-vercel" }
        "6" { return "deploy-aws" }
        "7" { return "deploy-github" }
        "8" { return "full-deploy" }
        "9" { return "info" }
        "10" { return "clean" }
        "0" { return "exit" }
        default { 
            Write-Host "❌ Opción no válida" -ForegroundColor Red
            return $null 
        }
    }
}

# EJECUCIÓN PRINCIPAL
Show-Welcome

if ($Help) {
    Show-Help
    exit 0
}

# Verificar entorno
if (-not (Test-Environment)) {
    Write-Host ""
    Write-Host "❌ El entorno no está correctamente configurado." -ForegroundColor Red
    Write-Host "📥 Asegúrate de tener Node.js, NPM y Git instalados." -ForegroundColor Yellow
    exit 1
}

# Instalar dependencias si no existen
if (-not (Test-Path "node_modules")) {
    Write-Host "📦 Instalando dependencias..." -ForegroundColor Blue
    npm install
    if ($LASTEXITCODE -ne 0) {
        Write-Host "❌ Error instalando dependencias" -ForegroundColor Red
        exit 1
    }
    Write-Host ""
}

# Determinar acción
if ([string]::IsNullOrWhiteSpace($Action)) {
    $Action = Show-Menu
    
    if ($null -eq $Action) {
        Write-Host "❌ Acción no válida. Reinicia el script." -ForegroundColor Red
        exit 1
    }
}

if ($Action -eq "exit") {
    Write-Host "👋 ¡Hasta luego!" -ForegroundColor Green
    exit 0
}

Write-Host ""

# Ejecutar acción
switch ($Action) {
    "dev" {
        Start-Development
    }
    
    "build" {
        Start-Build
    }
    
    "preview" {
        if (-not (Test-Path "dist")) {
            Write-Host "⚠️ No hay build disponible. Construyendo primero..." -ForegroundColor Yellow
            if (-not (Start-Build)) {
                exit 1
            }
        }
        Write-Host "👀 Iniciando preview..." -ForegroundColor Magenta
        Write-Host "🌐 Disponible en: http://localhost:4173" -ForegroundColor Cyan
        npm run preview
    }
    
    "deploy-netlify" {
        Write-Host "🌐 Iniciando deploy a Netlify..." -ForegroundColor Green
        .\deploy.ps1 -Platform netlify
    }
    
    "deploy-vercel" {
        Write-Host "▲ Iniciando deploy a Vercel..." -ForegroundColor Green
        .\deploy.ps1 -Platform vercel
    }
    
    "deploy-aws" {
        Write-Host "☁️ Iniciando deploy a AWS..." -ForegroundColor Green
        .\aws-deploy.ps1
    }
    
    "deploy-github" {
        Write-Host "🐙 Iniciando deploy a GitHub Pages..." -ForegroundColor Green
        .\deploy.ps1 -Platform github
    }
    
    "full-deploy" {
        Write-Host "🚀 Iniciando deploy completo..." -ForegroundColor Magenta
        Write-Host ""
        
        # 1. Build
        if (-not (Start-Build)) {
            exit 1
        }
        
        Write-Host ""
        
        # 2. Commit changes
        Write-Host "📝 Commiteando cambios..." -ForegroundColor Blue
        git add .
        git commit -m "feat: Update portfolio build - $(Get-Date -Format 'yyyy-MM-dd HH:mm')"
        
        # 3. Deploy
        Write-Host "🚀 Desplegando..." -ForegroundColor Blue
        .\deploy.ps1
    }
    
    "info" {
        Write-Host "📊 INFORMACIÓN DEL PROYECTO" -ForegroundColor Cyan
        Write-Host "═══════════════════════════════════" -ForegroundColor Gray
        Write-Host ""
        
        if (Test-Path "package.json") {
            $pkg = Get-Content "package.json" | ConvertFrom-Json
            Write-Host "📝 Nombre: $($pkg.name)" -ForegroundColor White
            Write-Host "🏷️ Versión: $($pkg.version)" -ForegroundColor White
            Write-Host "📄 Descripción: $($pkg.description)" -ForegroundColor White
        }
        
        Write-Host ""
        Write-Host "🛠️ Stack Tecnológico:" -ForegroundColor Yellow
        Write-Host "   • Vue.js 3 (Composition API)" -ForegroundColor Green
        Write-Host "   • Tailwind CSS" -ForegroundColor Green
        Write-Host "   • Vite (Build tool)" -ForegroundColor Green
        Write-Host "   • Vue Router" -ForegroundColor Green
        Write-Host "   • Heroicons" -ForegroundColor Green
        Write-Host "   • AOS Animations" -ForegroundColor Green
        
        Write-Host ""
        Write-Host "📋 Scripts disponibles:" -ForegroundColor Yellow
        Write-Host "   • npm run dev (Desarrollo)" -ForegroundColor Gray
        Write-Host "   • npm run build (Producción)" -ForegroundColor Gray
        Write-Host "   • npm run preview (Preview)" -ForegroundColor Gray
        
        Write-Host ""
        Write-Host "🚀 Scripts de deploy:" -ForegroundColor Yellow
        Write-Host "   • .\portfolio.ps1 (Este script)" -ForegroundColor Gray
        Write-Host "   • .\deploy.ps1 (Deploy avanzado)" -ForegroundColor Gray
        Write-Host "   • .\aws-deploy.ps1 (AWS específico)" -ForegroundColor Gray
    }
    
    "clean" {
        Write-Host "🧹 Limpiando proyecto..." -ForegroundColor Yellow
        
        # Limpiar node_modules
        if (Test-Path "node_modules") {
            Remove-Item -Recurse -Force "node_modules"
            Write-Host "   ✅ node_modules eliminado" -ForegroundColor Green
        }
        
        # Limpiar dist
        if (Test-Path "dist") {
            Remove-Item -Recurse -Force "dist"
            Write-Host "   ✅ dist eliminado" -ForegroundColor Green
        }
        
        # Limpiar package-lock
        if (Test-Path "package-lock.json") {
            Remove-Item -Force "package-lock.json"
            Write-Host "   ✅ package-lock.json eliminado" -ForegroundColor Green
        }
        
        Write-Host ""
        Write-Host "📦 Reinstalando dependencias..." -ForegroundColor Blue
        npm install
        
        if ($LASTEXITCODE -eq 0) {
            Write-Host "   ✅ Dependencias reinstaladas!" -ForegroundColor Green
        }
        else {
            Write-Host "   ❌ Error reinstalando dependencias" -ForegroundColor Red
        }
    }
    
    default {
        Write-Host "❌ Acción '$Action' no reconocida" -ForegroundColor Red
        Show-Help
        exit 1
    }
}

Write-Host ""
Write-Host "🎉 Operación completada!" -ForegroundColor Green
Write-Host ""
Write-Host "📞 Gabriel Troncoso - gabriel.troncoso.dev@gmail.com" -ForegroundColor Cyan
Write-Host "🐙 GitHub: https://github.com/Gatroxm" -ForegroundColor Cyan