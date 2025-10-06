# Portfolio Status Check
param([switch]$Quick)

Clear-Host
Write-Host "=== GABRIEL TRONCOSO PORTFOLIO STATUS ===" -ForegroundColor Cyan
Write-Host ""

# Verificar Node.js
Write-Host "Node.js: " -NoNewline
if (Get-Command "node" -ErrorAction SilentlyContinue) {
    $nodeVersion = node --version
    Write-Host "OK $nodeVersion" -ForegroundColor Green
    $nodeOk = $true
} else {
    Write-Host "FALTANTE" -ForegroundColor Red
    $nodeOk = $false
}

# Verificar package.json
Write-Host "package.json: " -NoNewline
if (Test-Path "package.json") {
    Write-Host "OK" -ForegroundColor Green
    $packageOk = $true
} else {
    Write-Host "FALTANTE" -ForegroundColor Red
    $packageOk = $false
}

# Verificar node_modules
Write-Host "node_modules: " -NoNewline
if (Test-Path "node_modules") {
    Write-Host "OK" -ForegroundColor Green
    $modulesOk = $true
} else {
    Write-Host "FALTANTE - Ejecutar: npm install" -ForegroundColor Yellow
    $modulesOk = $false
}

# Verificar scripts
Write-Host "portfolio.ps1: " -NoNewline
if (Test-Path "portfolio.ps1") {
    Write-Host "OK" -ForegroundColor Green
    $scriptOk = $true
} else {
    Write-Host "FALTANTE" -ForegroundColor Red
    $scriptOk = $false
}

# Resultado final
Write-Host ""
$allOk = $nodeOk -and $packageOk -and $modulesOk -and $scriptOk

if ($allOk) {
    Write-Host "STATUS: LISTO PARA USAR!" -ForegroundColor Green
    Write-Host ""
    Write-Host "Comandos disponibles:" -ForegroundColor Cyan
    Write-Host "  .\portfolio.ps1 dev" -ForegroundColor White
    Write-Host "  .\portfolio.ps1 build" -ForegroundColor White
    Write-Host "  .\portfolio.ps1 deploy-netlify" -ForegroundColor White
} else {
    Write-Host "STATUS: NECESITA CONFIGURACION" -ForegroundColor Red
    Write-Host ""
    Write-Host "Pasos a seguir:" -ForegroundColor Yellow
    if (-not $nodeOk) { Write-Host "1. Instalar Node.js" -ForegroundColor White }
    if (-not $packageOk) { Write-Host "2. Verificar directorio del proyecto" -ForegroundColor White }
    if (-not $modulesOk) { Write-Host "3. Ejecutar: npm install" -ForegroundColor White }
    if (-not $scriptOk) { Write-Host "4. Verificar scripts de PowerShell" -ForegroundColor White }
}

Write-Host ""