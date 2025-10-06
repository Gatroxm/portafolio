# 🚀 GABRIEL TRONCOSO PORTFOLIO - SETUP INICIAL
# Script para configurar el entorno completo de desarrollo

param(
    [switch]$SkipDependencies,
    [switch]$QuickSetup,
    [switch]$Help
)

function Show-Welcome {
    Clear-Host
    Write-Host "╔══════════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
    Write-Host "║                    🎯 GABRIEL TRONCOSO                           ║" -ForegroundColor Cyan
    Write-Host "║                   Portfolio Setup Wizard                        ║" -ForegroundColor Cyan
    Write-Host "║                                                                  ║" -ForegroundColor Cyan
    Write-Host "║     Configuración automática del entorno de desarrollo          ║" -ForegroundColor Cyan
    Write-Host "╚══════════════════════════════════════════════════════════════════╝" -ForegroundColor Cyan
    Write-Host ""
}

# Verificar prerrequisitos
Write-Host "📋 Verificando prerrequisitos..." -ForegroundColor Yellow
Write-Host ""

$prerequisites = @{
    "node" = "Node.js"
    "npm" = "NPM"
}

$missing = @()

foreach ($cmd in $prerequisites.Keys) {
    if (Test-Command $cmd) {
        $version = & $cmd --version 2>$null
        Write-Host "✅ $($prerequisites[$cmd]) - $version" -ForegroundColor Green
    } else {
        Write-Host "❌ $($prerequisites[$cmd]) - No encontrado" -ForegroundColor Red
        $missing += $prerequisites[$cmd]
    }
}

if ($missing.Count -gt 0) {
    Write-Host ""
    Write-Host "⚠️ Instala los siguientes componentes antes de continuar:" -ForegroundColor Yellow
    $missing | ForEach-Object { Write-Host "   • $_" -ForegroundColor Red }
    Write-Host ""
    Write-Host "📥 Descarga Node.js desde: https://nodejs.org/" -ForegroundColor Cyan
    exit 1
}

Write-Host ""
Write-Host "🎉 Prerrequisitos verificados correctamente!" -ForegroundColor Green
Write-Host ""

# Verificar si node_modules existe
$nodeModulesExists = Test-Path "node_modules"

if (-not $nodeModulesExists) {
    Write-Host "📦 Instalando dependencias..." -ForegroundColor Blue
    Write-Host ""
    
    try {
        npm install
        Write-Host ""
        Write-Host "✅ Dependencias instaladas correctamente!" -ForegroundColor Green
    }
    catch {
        Write-Host ""
        Write-Host "❌ Error al instalar dependencias: $($_.Exception.Message)" -ForegroundColor Red
        exit 1
    }
} else {
    Write-Host "✅ Dependencias ya instaladas" -ForegroundColor Green
}

Write-Host ""
Write-Host "🎯 ¿Qué deseas hacer?" -ForegroundColor Cyan
Write-Host ""
Write-Host "1. 🚀 Iniciar servidor de desarrollo"
Write-Host "2. 🔨 Build para producción"
Write-Host "3. 👀 Preview del build de producción"
Write-Host "4. 📊 Información del proyecto"
Write-Host "5. 🧹 Limpiar node_modules y reinstalar"
Write-Host "0. ❌ Salir"
Write-Host ""

$choice = Read-Host "Selecciona una opción (0-5)"

switch ($choice) {
    "1" {
        Write-Host ""
        Write-Host "🚀 Iniciando servidor de desarrollo..." -ForegroundColor Green
        Write-Host ""
        Write-Host "🌐 El portafolio estará disponible en:" -ForegroundColor Cyan
        Write-Host "   http://localhost:5173" -ForegroundColor White
        Write-Host ""
        Write-Host "⚡ Hot reload activado - Los cambios se verán automáticamente" -ForegroundColor Yellow
        Write-Host "📱 Responsive design - Prueba en diferentes dispositivos" -ForegroundColor Yellow
        Write-Host ""
        Write-Host "💡 Presiona Ctrl+C para detener el servidor" -ForegroundColor Gray
        Write-Host ""
        
        npm run dev
    }
    
    "2" {
        Write-Host ""
        Write-Host "🔨 Construyendo para producción..." -ForegroundColor Blue
        Write-Host ""
        
        try {
            npm run build
            Write-Host ""
            Write-Host "✅ Build completado exitosamente!" -ForegroundColor Green
            Write-Host "📁 Los archivos están en la carpeta 'dist'" -ForegroundColor Gray
            Write-Host ""
            Write-Host "🚀 Para desplegar, puedes usar:" -ForegroundColor Cyan
            Write-Host "   • Netlify: Arrastra la carpeta 'dist'" -ForegroundColor White
            Write-Host "   • Vercel: Conecta el repositorio" -ForegroundColor White
            Write-Host "   • GitHub Pages: Configura desde 'dist'" -ForegroundColor White
        }
        catch {
            Write-Host ""
            Write-Host "❌ Error en el build: $($_.Exception.Message)" -ForegroundColor Red
        }
    }
    
    "3" {
        Write-Host ""
        Write-Host "👀 Iniciando preview del build..." -ForegroundColor Magenta
        Write-Host ""
        Write-Host "🌐 Preview disponible en:" -ForegroundColor Cyan
        Write-Host "   http://localhost:4173" -ForegroundColor White
        Write-Host ""
        
        npm run preview
    }
    
    "4" {
        Write-Host ""
        Write-Host "📊 INFORMACIÓN DEL PROYECTO" -ForegroundColor Cyan
        Write-Host "═══════════════════════════════════" -ForegroundColor Gray
        Write-Host ""
        
        if (Test-Path "package.json") {
            $packageJson = Get-Content "package.json" | ConvertFrom-Json
            
            Write-Host "📝 Nombre: $($packageJson.name)" -ForegroundColor White
            Write-Host "🏷️ Versión: $($packageJson.version)" -ForegroundColor White
            Write-Host "📄 Descripción: $($packageJson.description)" -ForegroundColor White
            Write-Host ""
            
            Write-Host "🛠️ TECNOLOGÍAS PRINCIPALES:" -ForegroundColor Yellow
            Write-Host "   • Vue.js 3 (Composition API)" -ForegroundColor Green
            Write-Host "   • Tailwind CSS (Utility-first)" -ForegroundColor Green
            Write-Host "   • Vite (Build tool)" -ForegroundColor Green
            Write-Host "   • Vue Router 4" -ForegroundColor Green
            Write-Host "   • Heroicons (Iconografía)" -ForegroundColor Green
            Write-Host "   • AOS (Animaciones)" -ForegroundColor Green
            Write-Host ""
            
            Write-Host "📋 SECCIONES INCLUIDAS:" -ForegroundColor Yellow
            Write-Host "   ✅ Hero Section con presentación" -ForegroundColor Green
            Write-Host "   ✅ Sobre mí con timeline" -ForegroundColor Green
            Write-Host "   ✅ Habilidades técnicas" -ForegroundColor Green
            Write-Host "   ✅ Proyectos destacados" -ForegroundColor Green
            Write-Host "   ✅ Certificaciones y cursos" -ForegroundColor Green
            Write-Host "   ✅ Formulario de contacto" -ForegroundColor Green
            Write-Host ""
        }
        
        Write-Host "📁 Estructura del proyecto:" -ForegroundColor Yellow
        Get-ChildItem -Directory | Where-Object { $_.Name -ne 'node_modules' } | ForEach-Object {
            Write-Host "   📂 $($_.Name)" -ForegroundColor Gray
        }
    }
    
    "5" {
        Write-Host ""
        Write-Host "🧹 Limpiando node_modules..." -ForegroundColor Yellow
        
        if (Test-Path "node_modules") {
            Remove-Item -Recurse -Force "node_modules"
            Write-Host "   ✅ node_modules eliminado" -ForegroundColor Green
        }
        
        if (Test-Path "package-lock.json") {
            Remove-Item -Force "package-lock.json"
            Write-Host "   ✅ package-lock.json eliminado" -ForegroundColor Green
        }
        
        Write-Host ""
        Write-Host "📦 Reinstalando dependencias..." -ForegroundColor Blue
        
        try {
            npm install
            Write-Host ""
            Write-Host "✅ Reinstalación completada!" -ForegroundColor Green
        }
        catch {
            Write-Host ""
            Write-Host "❌ Error en la reinstalación: $($_.Exception.Message)" -ForegroundColor Red
        }
    }
    
    "0" {
        Write-Host ""
        Write-Host "👋 ¡Gracias por usar el portfolio!" -ForegroundColor Green
        Write-Host "🌟 No olvides dar estrella al repositorio" -ForegroundColor Yellow
        Write-Host ""
    }
    
    default {
        Write-Host ""
        Write-Host "❌ Opción no válida. Ejecuta el script de nuevo." -ForegroundColor Red
        Write-Host ""
    }
}

Write-Host ""
Write-Host "📞 Contacto: gabriel.troncoso.dev@gmail.com" -ForegroundColor Cyan
Write-Host "🐙 GitHub: https://github.com/Gatroxm" -ForegroundColor Cyan