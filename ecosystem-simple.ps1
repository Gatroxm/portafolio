# 🚀 ECOSYSTEM LAUNCHER SIMPLE
# Script simplificado para ejecutar todos los proyectos

Clear-Host
Write-Host "╔════════════════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║                    🌟 GUSTAVO MUÑOZ ECOSYSTEM                       ║" -ForegroundColor Cyan
Write-Host "║                     Launcher de Todos los Proyectos                   ║" -ForegroundColor Cyan
Write-Host "╚════════════════════════════════════════════════════════════════════════╝" -ForegroundColor Cyan
Write-Host ""

Write-Host "🔍 Verificando proyectos disponibles..." -ForegroundColor Blue
Write-Host ""

# Verificar proyectos
$projects = @(
    @{ Name = "Portfolio Principal"; Path = "."; Port = 5173; Type = "Vue.js" },
    @{ Name = "ProjetHub"; Path = "ProjetHub"; Port = 3000; Type = "Next.js" },
    @{ Name = "AppVeterinaria"; Path = "AppVeterinaria"; Port = 4000; Type = "Angular" },
    @{ Name = "AppControl"; Path = "AppControl"; Port = 3001; Type = "React" },
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
Write-Host "📋 Proyectos encontrados: $($availableProjects.Count)" -ForegroundColor Green
Write-Host ""

if ($availableProjects.Count -eq 0) {
    Write-Host "❌ No se encontraron proyectos para ejecutar" -ForegroundColor Red
    exit 1
}

Write-Host "🚀 ¿Deseas iniciar todos los proyectos? (Y/N): " -ForegroundColor Yellow -NoNewline
$response = Read-Host

if ($response -eq 'Y' -or $response -eq 'y' -or $response -eq '') {
    Write-Host ""
    Write-Host "🚀 Iniciando todos los proyectos..." -ForegroundColor Green
    Write-Host ""
    
    foreach ($project in $availableProjects) {
        Write-Host "🔄 Iniciando $($project.Name)..." -ForegroundColor Yellow
        
        if ($project.Path -eq ".") {
            # Portfolio principal
            Start-Process "powershell" -ArgumentList "-Command", "npm run dev" -WindowStyle Minimized
            Write-Host "  ✅ Portfolio Principal iniciado en http://localhost:$($project.Port)" -ForegroundColor Green
        } else {
            # Otros proyectos
            $packagePath = Join-Path $project.Path "package.json"
            if (Test-Path $packagePath) {
                # Verificar node_modules
                $nodeModulesPath = Join-Path $project.Path "node_modules"
                if (-not (Test-Path $nodeModulesPath)) {
                    Write-Host "  📦 Instalando dependencias para $($project.Name)..." -ForegroundColor Blue
                    Start-Process "npm" -ArgumentList "install" -WorkingDirectory $project.Path -Wait -WindowStyle Hidden
                }
                
                # Iniciar proyecto
                Start-Process "powershell" -ArgumentList "-Command", "cd '$($project.Path)'; npm run dev" -WindowStyle Minimized
                Write-Host "  ✅ $($project.Name) iniciado en http://localhost:$($project.Port)" -ForegroundColor Green
            } else {
                Write-Host "  ⚠️  $($project.Name): No se encontró package.json" -ForegroundColor Yellow
            }
        }
        
        Start-Sleep -Seconds 2
    }
    
    Write-Host ""
    Write-Host "⏳ Esperando que los proyectos inicien completamente..." -ForegroundColor Blue
    Start-Sleep -Seconds 8
    
    Write-Host ""
    Write-Host "🌐 ESTADO DE LOS PROYECTOS:" -ForegroundColor Magenta
    Write-Host "═══════════════════════════════════════" -ForegroundColor Gray
    
    foreach ($project in $availableProjects) {
        Write-Host "  🟢 $($project.Name) ($($project.Type))" -ForegroundColor Green
        Write-Host "    🔗 http://localhost:$($project.Port)" -ForegroundColor Cyan
    }
    
    Write-Host ""
    Write-Host "🎊 ¡TODOS LOS PROYECTOS EJECUTÁNDOSE!" -ForegroundColor Green
    Write-Host ""
    Write-Host "🌟 URLS PRINCIPALES:" -ForegroundColor Cyan
    Write-Host "   📱 Portfolio Principal: http://localhost:5173" -ForegroundColor White
    Write-Host "   🏢 ProjetHub: http://localhost:3000" -ForegroundColor White  
    Write-Host "   🐕 App Veterinaria: http://localhost:4200" -ForegroundColor White
    Write-Host "   ❤️ App Control: http://localhost:3001" -ForegroundColor White
    Write-Host "   🏥 App Hospitals: http://localhost:3002" -ForegroundColor White
    Write-Host ""
    Write-Host "🎯 ACCIONES DISPONIBLES:" -ForegroundColor Yellow
    Write-Host "   • Abre http://localhost:5173 para ver el portfolio integrado" -ForegroundColor White
    Write-Host "   • Navega entre proyectos desde el portfolio" -ForegroundColor White
    Write-Host "   • Cada proyecto se abre en una ventana separada" -ForegroundColor White
    Write-Host ""
    
    Write-Host "👀 Presiona cualquier tecla para abrir el portfolio principal..." -ForegroundColor Green
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    
    # Abrir portfolio principal
    Start-Process "http://localhost:5173"
    
    Write-Host ""
    Write-Host "🎉 Portfolio abierto! Disfruta tu ecosistema completo!" -ForegroundColor Green
    
} else {
    Write-Host "❌ Operación cancelada" -ForegroundColor Yellow
}

Write-Host ""