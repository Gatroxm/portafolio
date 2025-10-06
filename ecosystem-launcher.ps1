# 🚀 GABRIEL TRONCOSO - ECOSYSTEM LAUNCHER
# Script para ejecutar todos los proyectos del ecosistema

param(
    [switch]$Help,
    [switch]$DevMode,
    [switch]$ProductionMode
)

function Show-Header {
    Clear-Host
    Write-Host "╔════════════════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
    Write-Host "║                    🌟 GABRIEL TRONCOSO ECOSYSTEM                       ║" -ForegroundColor Cyan
    Write-Host "║                     Launcher de Todos los Proyectos                   ║" -ForegroundColor Cyan
    Write-Host "╚════════════════════════════════════════════════════════════════════════╝" -ForegroundColor Cyan
    Write-Host ""
}

function Test-ProjectStructure {
    Write-Host "🔍 Verificando proyectos disponibles..." -ForegroundColor Blue
    Write-Host ""
    
    $projects = @(
        @{ Name = "Portfolio Principal"; Path = "."; Port = 5173; Type = "Vue.js" }
        @{ Name = "ProjetHub"; Path = "ProjetHub"; Port = 3000; Type = "Next.js" }
        @{ Name = "AppVeterinaria"; Path = "AppVeterinaria"; Port = 4000; Type = "Angular" }
        @{ Name = "AppControl"; Path = "AppControl"; Port = 3001; Type = "React" }
        @{ Name = "AppAdminHospitals"; Path = "AppAdminHospitals"; Port = 3002; Type = "Vue.js" }
    )
    
    $availableProjects = @()
    
    foreach ($project in $projects) {
        $exists = Test-Path $project.Path
        $symbol = if ($exists) { "✅" } else { "❌" }
        $color = if ($exists) { "Green" } else { "Red" }
        
        Write-Host "  $symbol $($project.Name) ($($project.Type)) - Puerto $($project.Port)" -ForegroundColor $color
        
        if ($exists) {
            $availableProjects += $project
        }
    }
    
    Write-Host ""
    return $availableProjects
}

function Start-AllProjects {
    param($projects)
    
    Write-Host "🚀 Iniciando todos los proyectos..." -ForegroundColor Green
    Write-Host ""
    
    $runningProcesses = @()
    
    foreach ($project in $projects) {
        Write-Host "🔄 Iniciando $($project.Name)..." -ForegroundColor Yellow
        
        try {
            if ($project.Path -eq ".") {
                # Portfolio principal
                $process = Start-Process "npm" -ArgumentList "run", "dev" -WorkingDirectory $project.Path -PassThru -WindowStyle Hidden
                Write-Host "  ✅ Portfolio Principal iniciado en http://localhost:$($project.Port)" -ForegroundColor Green
            } else {
                # Verificar si tiene package.json
                $packagePath = Join-Path $project.Path "package.json"
                if (Test-Path $packagePath) {
                    # Instalar dependencias si no existen
                    $nodeModulesPath = Join-Path $project.Path "node_modules"
                    if (-not (Test-Path $nodeModulesPath)) {
                        Write-Host "  📦 Instalando dependencias para $($project.Name)..." -ForegroundColor Blue
                        Start-Process "npm" -ArgumentList "install" -WorkingDirectory $project.Path -Wait -WindowStyle Hidden
                    }
                    
                    # Iniciar el proyecto
                    switch ($project.Type) {
                        "Next.js" {
                            $process = Start-Process "npm" -ArgumentList "run", "dev", "--", "-p", $project.Port -WorkingDirectory $project.Path -PassThru -WindowStyle Hidden
                        }
                        "Angular" {
                            $process = Start-Process "npm" -ArgumentList "start", "--", "--port", $project.Port -WorkingDirectory $project.Path -PassThru -WindowStyle Hidden
                        }
                        "React" {
                            $env:PORT = $project.Port
                            $process = Start-Process "npm" -ArgumentList "start" -WorkingDirectory $project.Path -PassThru -WindowStyle Hidden
                        }
                        "Vue.js" {
                            $process = Start-Process "npm" -ArgumentList "run", "dev", "--", "--port", $project.Port -WorkingDirectory $project.Path -PassThru -WindowStyle Hidden
                        }
                        default {
                            $process = Start-Process "npm" -ArgumentList "run", "dev" -WorkingDirectory $project.Path -PassThru -WindowStyle Hidden
                        }
                    }
                    
                    Write-Host "  ✅ $($project.Name) iniciado en http://localhost:$($project.Port)" -ForegroundColor Green
                } else {
                    Write-Host "  ⚠️  $($project.Name): No se encontró package.json" -ForegroundColor Yellow
                }
            }
            
            if ($process) {
                $runningProcesses += @{
                    Name = $project.Name
                    Process = $process
                    Port = $project.Port
                    Type = $project.Type
                }
            }
        } catch {
            Write-Host "  ❌ Error iniciando $($project.Name): $($_.Exception.Message)" -ForegroundColor Red
        }
        
        Start-Sleep -Seconds 2
    }
    
    Write-Host ""
    return $runningProcesses
}

function Show-ProjectsStatus {
    param($processes)
    
    Write-Host "🌐 ESTADO DE LOS PROYECTOS:" -ForegroundColor Magenta
    Write-Host "═══════════════════════════════════════" -ForegroundColor Gray
    
    foreach ($proc in $processes) {
        $status = if ($proc.Process -and -not $proc.Process.HasExited) { "🟢 EJECUTÁNDOSE" } else { "🔴 DETENIDO" }
        $color = if ($proc.Process -and -not $proc.Process.HasExited) { "Green" } else { "Red" }
        
        Write-Host "  $status $($proc.Name) ($($proc.Type))" -ForegroundColor $color
        Write-Host "    🔗 http://localhost:$($proc.Port)" -ForegroundColor Cyan
    }
    
    Write-Host ""
}

function Create-ProjectsNavigation {
    Write-Host "🎯 Creando navegación integrada en el portfolio..." -ForegroundColor Blue
    
    # Crear archivo de configuración para integrar proyectos
    $projectsConfig = @"
// Configuración de proyectos para navegación integrada
export const projects = [
  {
    id: 'portfolio',
    name: 'Portfolio Principal',
    url: 'http://localhost:5173',
    type: 'Vue.js',
    description: 'Portfolio personal con Vue.js 3 + Tailwind CSS'
  },
  {
    id: 'projethub', 
    name: 'ProjetHub',
    url: 'http://localhost:3000',
    type: 'Next.js',
    description: 'Plataforma SaaS Multi-Tenant con estimaciones IA'
  },
  {
    id: 'veterinaria',
    name: 'App Veterinaria', 
    url: 'http://localhost:4000',
    type: 'Angular',
    description: 'Sistema completo de gestión veterinaria'
  },
  {
    id: 'control',
    name: 'App Control',
    url: 'http://localhost:3001', 
    type: 'React',
    description: 'Sistema de control y monitoreo de salud'
  },
  {
    id: 'hospitals',
    name: 'App Admin Hospitals',
    url: 'http://localhost:3002',
    type: 'Vue.js', 
    description: 'Sistema integral para administración hospitalaria'
  }
];

export const getProjectUrl = (projectId) => {
  const project = projects.find(p => p.id === projectId);
  return project ? project.url : '#';
};
"@
    
    Set-Content -Path "src/config/projects.js" -Value $projectsConfig -Encoding UTF8
    Write-Host "  ✅ Configuración de proyectos creada" -ForegroundColor Green
}

function Show-FinalInstructions {
    param($processes)
    
    Write-Host "🎊 ¡TODOS LOS PROYECTOS EJECUTÁNDOSE!" -ForegroundColor Green
    Write-Host ""
    Write-Host "🌟 URLS PRINCIPALES:" -ForegroundColor Cyan
    Write-Host "   📱 Portfolio Principal: http://localhost:5173" -ForegroundColor White
    Write-Host "   🏢 ProjetHub: http://localhost:3000" -ForegroundColor White  
    Write-Host "   🐕 App Veterinaria: http://localhost:4000" -ForegroundColor White
    Write-Host "   ❤️ App Control: http://localhost:3001" -ForegroundColor White
    Write-Host "   🏥 App Hospitals: http://localhost:3002" -ForegroundColor White
    Write-Host ""
    Write-Host "🎯 ACCIONES DISPONIBLES:" -ForegroundColor Yellow
    Write-Host "   • Abre http://localhost:5173 para ver el portfolio integrado" -ForegroundColor White
    Write-Host "   • Navega entre proyectos desde el portfolio" -ForegroundColor White
    Write-Host "   • Presiona Ctrl+C en cada terminal para detener" -ForegroundColor White
    Write-Host ""
    Write-Host "⚡ PRÓXIMOS PASOS:" -ForegroundColor Magenta
    Write-Host "   1. Personalizar contenido de cada proyecto" -ForegroundColor White
    Write-Host "   2. Integrar autenticación compartida" -ForegroundColor White
    Write-Host "   3. Deploy del ecosistema completo" -ForegroundColor White
    Write-Host ""
}

# EJECUCIÓN PRINCIPAL
Show-Header

if ($Help) {
    Write-Host "📋 USO DEL ECOSYSTEM LAUNCHER:" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "  .\ecosystem-launcher.ps1           # Ejecutar todos los proyectos" -ForegroundColor White
    Write-Host "  .\ecosystem-launcher.ps1 -DevMode  # Solo modo desarrollo" -ForegroundColor White  
    Write-Host "  .\ecosystem-launcher.ps1 -Help     # Mostrar esta ayuda" -ForegroundColor White
    Write-Host ""
    exit 0
}

# Verificar proyectos disponibles
$availableProjects = Test-ProjectStructure

if ($availableProjects.Count -eq 0) {
    Write-Host "❌ No se encontraron proyectos para ejecutar" -ForegroundColor Red
    exit 1
}

Write-Host "📋 Proyectos encontrados: $($availableProjects.Count)" -ForegroundColor Green
Write-Host ""

# Crear directorio de configuración si no existe
if (-not (Test-Path "src/config")) {
    New-Item -ItemType Directory -Path "src/config" -Force | Out-Null
}

# Crear navegación integrada
Create-ProjectsNavigation

# Iniciar todos los proyectos
Write-Host "🚀 ¿Deseas iniciar todos los proyectos? (Y/N): " -ForegroundColor Yellow -NoNewline
$response = Read-Host

if ($response -eq 'Y' -or $response -eq 'y' -or $response -eq '') {
    $runningProcesses = Start-AllProjects -projects $availableProjects
    
    # Esperar un momento para que inicien
    Write-Host "⏳ Esperando que los proyectos inicien completamente..." -ForegroundColor Blue
    Start-Sleep -Seconds 10
    
    # Mostrar estado
    Show-ProjectsStatus -processes $runningProcesses
    
    # Mostrar instrucciones finales
    Show-FinalInstructions -processes $runningProcesses
    
    Write-Host "👀 Presiona cualquier tecla para abrir el portfolio principal..." -ForegroundColor Green
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    
    # Abrir portfolio principal
    Start-Process "http://localhost:5173"
    
} else {
    Write-Host "❌ Operación cancelada" -ForegroundColor Yellow
}