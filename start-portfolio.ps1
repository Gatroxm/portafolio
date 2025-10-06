Write-Host "🌟 GUSTAVO MUÑOZ ECOSYSTEM LAUNCHER" -ForegroundColor Cyan
Write-Host "=====================================" -ForegroundColor Gray
Write-Host ""

Write-Host "📋 Proyectos disponibles:" -ForegroundColor Yellow

# Portfolio Principal
Write-Host "  ✅ Portfolio Principal (Vue.js) - Puerto 5173" -ForegroundColor Green

# Verificar otros proyectos
if (Test-Path "ProjetHub") {
    Write-Host "  ✅ ProjetHub (Next.js) - Puerto 3000" -ForegroundColor Green
} else {
    Write-Host "  ❌ ProjetHub - No encontrado" -ForegroundColor Red
}

if (Test-Path "AppVeterinaria") {
    Write-Host "  ✅ AppVeterinaria (Angular) - Puerto 4000" -ForegroundColor Green
} else {
    Write-Host "  ❌ AppVeterinaria - No encontrado" -ForegroundColor Red
}

if (Test-Path "AppControl") {
    Write-Host "  ✅ AppControl (React) - Puerto 3001" -ForegroundColor Green
} else {
    Write-Host "  ❌ AppControl - No encontrado" -ForegroundColor Red
}

if (Test-Path "AppAdminHospitals") {
    Write-Host "  ✅ AppAdminHospitals (Vue.js) - Puerto 3002" -ForegroundColor Green
} else {
    Write-Host "  ❌ AppAdminHospitals - No encontrado" -ForegroundColor Red
}

Write-Host ""
Write-Host "🚀 ¿Iniciar el Portfolio Principal? (Y/N): " -ForegroundColor Yellow -NoNewline
$response = Read-Host

if ($response -eq 'Y' -or $response -eq 'y' -or $response -eq '') {
    Write-Host ""
    Write-Host "🔄 Iniciando Portfolio Principal..." -ForegroundColor Blue
    
    # Iniciar portfolio
    npm run dev
    
} else {
    Write-Host "❌ Cancelado" -ForegroundColor Red
}