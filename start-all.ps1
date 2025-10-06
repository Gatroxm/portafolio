# GUSTAVO MUÑOZ ECOSYSTEM - START ALL PROJECTS
Write-Host "INICIANDO ECOSYSTEM COMPLETO" -ForegroundColor Cyan
Write-Host "===============================" -ForegroundColor Gray
Write-Host ""

# Funcion para iniciar proyecto en nueva ventana
function Start-ProjectInNewWindow {
    param(
        [string]$Name,
        [string]$Path,
        [int]$Port,
        [string]$Command
    )
    
    Write-Host "Iniciando $Name en puerto $Port..." -ForegroundColor Yellow
    
    if ($Path -eq ".") {
        Start-Process powershell -ArgumentList "-NoExit", "-Command", $Command -WindowStyle Normal
    } else {
        $fullCommand = "cd '$Path'; $Command"
        Start-Process powershell -ArgumentList "-NoExit", "-Command", $fullCommand -WindowStyle Normal
    }
    
    Write-Host "   OK $Name - http://localhost:$Port" -ForegroundColor Green
    Start-Sleep -Seconds 2
}

Write-Host "Iniciando todos los proyectos..." -ForegroundColor Green
Write-Host ""

# Iniciar cada proyecto con sus comandos correctos y puertos separados
Start-ProjectInNewWindow "Portfolio Principal" "." 5173 "npm run dev"
Start-ProjectInNewWindow "ProjetHub Frontend" "ProjetHub" 3000 "npm run dev"
Start-ProjectInNewWindow "ProjetHub Backend" "ProjetHub" 5000 "npm run backend:dev"
Start-ProjectInNewWindow "AppControl Frontend" "AppControl" 3001 "npm run client"
Start-ProjectInNewWindow "AppControl Backend" "AppControl" 5001 "npm run server"
Start-ProjectInNewWindow "AppVeterinaria Frontend" "AppVeterinaria\frontend" 4200 "ng serve --port 4200 --host 0.0.0.0"

Write-Host ""
Write-Host "Esperando que todos los proyectos inicien..." -ForegroundColor Blue
Write-Host ""
Write-Host "URLS FRONTENDS (Para usar en el navegador):" -ForegroundColor Magenta
Write-Host "   Portfolio Principal: http://localhost:5173" -ForegroundColor White
Write-Host "   ProjetHub Frontend: http://localhost:3000" -ForegroundColor White
Write-Host "   AppControl Frontend: http://localhost:3001" -ForegroundColor White
Write-Host "   AppVeterinaria Frontend: http://localhost:4200" -ForegroundColor White
Write-Host ""
Write-Host "URLS BACKENDS (APIs):" -ForegroundColor Yellow
Write-Host "   ProjetHub API: http://localhost:5000" -ForegroundColor Gray
Write-Host "   AppControl API: http://localhost:5001" -ForegroundColor Gray
Write-Host ""
Write-Host "INSTRUCCIONES:" -ForegroundColor Yellow
Write-Host "   1. Espera 60-90 segundos a que todos inicien" -ForegroundColor White
Write-Host "   2. Abre http://localhost:5173 (Portfolio de Gustavo Munoz)" -ForegroundColor White
Write-Host "   3. Ve a la seccion Proyectos Destacados" -ForegroundColor White
Write-Host "   4. Haz clic en los botones verdes En Vivo" -ForegroundColor White
Write-Host "   5. Cada boton abrira el proyecto funcionando!" -ForegroundColor White
Write-Host ""
Write-Host "NOTAS:" -ForegroundColor Cyan
Write-Host "   - ProjetHub es una plataforma SaaS completa" -ForegroundColor White
Write-Host "   - AppControl maneja frontend React + backend Node.js" -ForegroundColor White
Write-Host "   - AppVeterinaria puede tomar mas tiempo en iniciar" -ForegroundColor White
Write-Host ""
Write-Host "Abriendo Portfolio Principal..." -ForegroundColor Yellow
Start-Sleep -Seconds 3
Start-Process "http://localhost:5173"
Write-Host ""
Write-Host "Disfruta tu ecosystem completo, Gustavo!" -ForegroundColor Green