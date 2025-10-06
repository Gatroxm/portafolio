# 🚀 Inicializador del Portafolio
# Script para configurar y verificar todos los proyectos del portafolio

Write-Host "🎯 === GUSTAVO MUÑOZ - PORTAFOLIO SETUP ===" -ForegroundColor Cyan
Write-Host ""

# Función para verificar si un comando existe
function Test-Command($command) {
    $null = Get-Command $command -ErrorAction SilentlyContinue
    return $?
}

# Verificar prerrequisitos
Write-Host "📋 Verificando prerrequisitos..." -ForegroundColor Yellow
Write-Host ""

$prerequisites = @{
    "node"  = "Node.js"
    "npm"   = "NPM"
    "git"   = "Git"
    "mongo" = "MongoDB"
}

$missing = @()

foreach ($cmd in $prerequisites.Keys) {
    if (Test-Command $cmd) {
        Write-Host "✅ $($prerequisites[$cmd]) - Instalado" -ForegroundColor Green
    }
    else {
        Write-Host "❌ $($prerequisites[$cmd]) - No encontrado" -ForegroundColor Red
        $missing += $prerequisites[$cmd]
    }
}

if ($missing.Count -gt 0) {
    Write-Host ""
    Write-Host "⚠️  Instala los siguientes componentes antes de continuar:" -ForegroundColor Yellow
    $missing | ForEach-Object { Write-Host "   • $_" -ForegroundColor Red }
    Write-Host ""
    Write-Host "📥 Links de descarga:" -ForegroundColor Cyan
    Write-Host "   • Node.js: https://nodejs.org/"
    Write-Host "   • Git: https://git-scm.com/"
    Write-Host "   • MongoDB: https://www.mongodb.com/try/download/community"
    exit 1
}

Write-Host ""
Write-Host "🎉 Todos los prerrequisitos están instalados!" -ForegroundColor Green
Write-Host ""

# Mostrar estructura del portafolio
Write-Host "📁 Estructura del Portafolio:" -ForegroundColor Cyan
Write-Host ""

$projects = @(
    @{Name = "App Admin Hospitals"; Path = "AppAdminHospitals"; Status = "En Desarrollo"; Tech = "Vue.js + Node.js + MongoDB" },
    @{Name = "App Veterinaria"; Path = "AppVeterinaria"; Status = "Completado"; Tech = "Angular + Node.js + MongoDB" },
    @{Name = "App Control"; Path = "AppControl"; Status = "Completado"; Tech = "React + Node.js + MongoDB" },
    @{Name = "Project Hub"; Path = "ProjetHub"; Status = "Activo"; Tech = "Next.js + Node.js + MongoDB Atlas" }
)

foreach ($project in $projects) {
    $exists = Test-Path $project.Path
    $status = if ($exists) { "📁 Disponible" } else { "❌ No encontrado" }
    $color = if ($exists) { "Green" } else { "Red" }
    
    Write-Host "  🚀 $($project.Name)" -ForegroundColor White
    Write-Host "     Status: $status" -ForegroundColor $color
    Write-Host "     Tech Stack: $($project.Tech)" -ForegroundColor Gray
    Write-Host "     Estado: $($project.Status)" -ForegroundColor Magenta
    Write-Host ""
}

# Menú de opciones
Write-Host "🔧 ¿Qué deseas hacer?" -ForegroundColor Cyan
Write-Host ""
Write-Host "1. 📋 Ver información detallada de un proyecto"
Write-Host "2. 🚀 Configurar proyecto específico"
Write-Host "3. 📊 Ejecutar verificación de salud del portafolio"
Write-Host "4. 🌐 Abrir GitHub del portafolio"
Write-Host "5. 📝 Ver todos los README.md"
Write-Host "0. ❌ Salir"
Write-Host ""

$choice = Read-Host "Selecciona una opción (0-5)"

switch ($choice) {
    "1" {
        Write-Host ""
        Write-Host "📋 Proyectos disponibles:" -ForegroundColor Cyan
        for ($i = 0; $i -lt $projects.Count; $i++) {
            Write-Host "$($i + 1). $($projects[$i].Name)" -ForegroundColor White
        }
        Write-Host ""
        $projectChoice = Read-Host "Selecciona un proyecto (1-$($projects.Count))"
        $selectedProject = $projects[$projectChoice - 1]
        
        if ($selectedProject) {
            Write-Host ""
            Write-Host "📖 Información de: $($selectedProject.Name)" -ForegroundColor Yellow
            Write-Host "📁 Ruta: ./$($selectedProject.Path)" -ForegroundColor Gray
            Write-Host "💻 Tecnologías: $($selectedProject.Tech)" -ForegroundColor Gray
            Write-Host "📊 Estado: $($selectedProject.Status)" -ForegroundColor Gray
            
            if (Test-Path "$($selectedProject.Path)/README.md") {
                Write-Host ""
                Write-Host "📝 Abriendo README.md..." -ForegroundColor Green
                Start-Process notepad.exe "$($selectedProject.Path)/README.md"
            }
        }
    }
    
    "2" {
        Write-Host ""
        Write-Host "🚀 Configuración de proyectos disponible individualmente." -ForegroundColor Green
        Write-Host "📁 Navega a cada carpeta y ejecuta los scripts correspondientes:" -ForegroundColor Yellow
        Write-Host ""
        Write-Host "   • AppVeterinaria: .\init.ps1"
        Write-Host "   • AppControl: .\init.ps1"
        Write-Host "   • ProjetHub: .\iniciar_servidores.ps1"
        Write-Host ""
    }
    
    "3" {
        Write-Host ""
        Write-Host "📊 Ejecutando verificación de salud..." -ForegroundColor Yellow
        Write-Host ""
        
        foreach ($project in $projects) {
            if (Test-Path $project.Path) {
                Write-Host "✅ $($project.Name) - Estructura OK" -ForegroundColor Green
                
                # Verificar package.json
                if (Test-Path "$($project.Path)/package.json" -or Test-Path "$($project.Path)/backend/package.json") {
                    Write-Host "   📦 package.json encontrado" -ForegroundColor Gray
                }
                else {
                    Write-Host "   ⚠️  package.json no encontrado" -ForegroundColor Yellow
                }
                
                # Verificar README.md
                if (Test-Path "$($project.Path)/README.md") {
                    Write-Host "   📝 README.md actualizado" -ForegroundColor Gray
                }
                else {
                    Write-Host "   ❌ README.md faltante" -ForegroundColor Red
                }
            }
            else {
                Write-Host "❌ $($project.Name) - Proyecto no encontrado" -ForegroundColor Red
            }
            Write-Host ""
        }
    }
    
    "4" {
        Write-Host ""
        Write-Host "🌐 Abriendo GitHub..." -ForegroundColor Green
        Start-Process "https://github.com/Gatroxm/portafolio"
    }
    
    "5" {
        Write-Host ""
        Write-Host "📝 Abriendo todos los README.md..." -ForegroundColor Green
        
        # README principal
        if (Test-Path "README.md") {
            Start-Process notepad.exe "README.md"
        }
        
        # READMEs de proyectos
        foreach ($project in $projects) {
            if (Test-Path "$($project.Path)/README.md") {
                Start-Process notepad.exe "$($project.Path)/README.md"
            }
        }
    }
    
    "0" {
        Write-Host ""
        Write-Host "👋 ¡Hasta luego!" -ForegroundColor Green
        Write-Host ""
    }
    
    default {
        Write-Host ""
        Write-Host "❌ Opción no válida. Intenta de nuevo." -ForegroundColor Red
        Write-Host ""
    }
}

Write-Host ""
Write-Host "📞 Contacto: tavoxpau@gmail.com" -ForegroundColor Cyan
Write-Host "🐙 GitHub: https://github.com/Gatroxm" -ForegroundColor Cyan
Write-Host ""
Write-Host "⭐ ¡No olvides dar estrella a los repositorios que te gusten!" -ForegroundColor Yellow