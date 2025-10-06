# 🔍 PORTFOLIO STATUS CHECK
# Script simplificado para verificar el estado del portfolio

param(
    [switch]$Quick,
    [switch]$Help
)

function Show-Header {
    Clear-Host
    Write-Host "╔══════════════════════════════════════════════════════════════════╗" -ForegroundColor Blue
    Write-Host "║                      🔍 PORTFOLIO STATUS                        ║" -ForegroundColor Blue
    Write-Host "║                   Gustavo Muñoz - Health Check               ║" -ForegroundColor Blue
    Write-Host "╚══════════════════════════════════════════════════════════════════╝" -ForegroundColor Blue
    Write-Host ""
}

function Test-QuickStatus {
    Write-Host "⚡ VERIFICACIÓN RÁPIDA" -ForegroundColor Yellow
    Write-Host ""
    
    # Node.js
    Write-Host "Node.js: " -NoNewline
    if (Get-Command "node" -ErrorAction SilentlyContinue) {
        $nodeVersion = node --version
        Write-Host "✅ $nodeVersion" -ForegroundColor Green
        $nodeOk = $true
    } else {
        Write-Host "❌ No instalado" -ForegroundColor Red
        $nodeOk = $false
    }
    
    # package.json
    Write-Host "package.json: " -NoNewline  
    if (Test-Path "package.json") {
        Write-Host "✅ Presente" -ForegroundColor Green
        $packageOk = $true
    } else {
        Write-Host "❌ No encontrado" -ForegroundColor Red
        $packageOk = $false
    }
    
    # node_modules
    Write-Host "node_modules: " -NoNewline
    if (Test-Path "node_modules") {
        Write-Host "✅ Presente" -ForegroundColor Green
        $modulesOk = $true
    } else {
        Write-Host "❌ No encontrado" -ForegroundColor Red
        $modulesOk = $false
    }
    
    # Scripts principales
    Write-Host "portfolio.ps1: " -NoNewline
    if (Test-Path "portfolio.ps1") {
        Write-Host "✅ Disponible" -ForegroundColor Green
        $scriptOk = $true
    } else {
        Write-Host "❌ No encontrado" -ForegroundColor Red
        $scriptOk = $false
    }
    
    $allOk = $nodeOk -and $packageOk -and $modulesOk -and $scriptOk
    Write-Host ""
    Write-Host "Estado General: " -NoNewline
    if ($allOk) {
        Write-Host "✅ LISTO PARA USAR" -ForegroundColor Green
        Write-Host ""
        Write-Host "🚀 Comandos sugeridos:" -ForegroundColor Cyan
        Write-Host "  .\portfolio.ps1 dev              # Iniciar desarrollo" -ForegroundColor White
        Write-Host "  .\portfolio.ps1 build            # Build de producción" -ForegroundColor White
        Write-Host "  .\portfolio.ps1 deploy-netlify   # Deploy a Netlify" -ForegroundColor White
    } else {
        Write-Host "❌ NECESITA CONFIGURACIÓN" -ForegroundColor Red
        Write-Host ""
        Write-Host "🔧 Acciones recomendadas:" -ForegroundColor Yellow
        if (-not $nodeOk) { Write-Host "  • Instalar Node.js desde https://nodejs.org/" -ForegroundColor White }
        if (-not $packageOk) { Write-Host "  • Verificar que estás en el directorio correcto del proyecto" -ForegroundColor White }
        if (-not $modulesOk) { Write-Host "  • Ejecutar: npm install" -ForegroundColor White }
        if (-not $scriptOk) { Write-Host "  • Verificar que los scripts de PowerShell están presentes" -ForegroundColor White }
    }
    
    return $allOk
}

function Test-FullStatus {
    Write-Host "🔍 VERIFICACIÓN COMPLETA" -ForegroundColor Cyan
    Write-Host "═══════════════════════════" -ForegroundColor Gray
    Write-Host ""
    
    # Requisitos del sistema
    Write-Host "🖥️  SISTEMA:" -ForegroundColor Yellow
    $systemChecks = @(
        @{ Name = "Node.js"; Command = "node"; Flag = "--version" },
        @{ Name = "NPM"; Command = "npm"; Flag = "--version" },
        @{ Name = "Git"; Command = "git"; Flag = "--version" }
    )
    
    $systemOk = $true
    foreach ($check in $systemChecks) {
        Write-Host "  $($check.Name): " -NoNewline
        if (Get-Command $check.Command -ErrorAction SilentlyContinue) {
            try {
                $version = & $check.Command $check.Flag.Split(' ') 2>$null | Select-Object -First 1
                Write-Host "✅ $version" -ForegroundColor Green
            } catch {
                Write-Host "✅ Instalado" -ForegroundColor Green
            }
        } else {
            Write-Host "❌ No instalado" -ForegroundColor Red
            $systemOk = $false
        }
    }
    
    Write-Host ""
    
    # Archivos del proyecto
    Write-Host "📁 ARCHIVOS DEL PROYECTO:" -ForegroundColor Yellow
    $projectFiles = @(
        @{ Path = "package.json"; Critical = $true },
        @{ Path = "src/App.vue"; Critical = $true },
        @{ Path = "src/main.js"; Critical = $true },
        @{ Path = "index.html"; Critical = $true },
        @{ Path = "vite.config.js"; Critical = $true },
        @{ Path = "node_modules"; Critical = $false },
        @{ Path = "dist"; Critical = $false }
    )
    
    $projectOk = $true
    foreach ($file in $projectFiles) {
        $exists = Test-Path $file.Path
        $symbol = if ($exists) { "✅" } else { if ($file.Critical) { "❌" } else { "⚪" } }
        $color = if ($exists) { "Green" } else { if ($file.Critical) { "Red" } else { "Gray" } }
        $status = if ($exists) { "OK" } else { if ($file.Critical) { "FALTANTE" } else { "Opcional" } }
        
        Write-Host "  $symbol $($file.Path) - $status" -ForegroundColor $color
        
        if (-not $exists -and $file.Critical) {
            $projectOk = $false
        }
    }
    
    Write-Host ""
    
    # Scripts disponibles
    Write-Host "⚙️  SCRIPTS:" -ForegroundColor Yellow
    $scripts = @("portfolio.ps1", "deploy.ps1", "aws-deploy.ps1", "setup.ps1")
    $scriptsOk = $true
    
    foreach ($script in $scripts) {
        $exists = Test-Path $script
        $symbol = if ($exists) { "✅" } else { "❌" }
        $color = if ($exists) { "Green" } else { "Red" }
        Write-Host "  $symbol $script" -ForegroundColor $color
        if (-not $exists -and $script -eq "portfolio.ps1") {
            $scriptsOk = $false
        }
    }
    
    Write-Host ""
    
    # Resumen final
    $totalScore = 0
    if ($systemOk) { $totalScore++ }
    if ($projectOk) { $totalScore++ }
    if ($scriptsOk) { $totalScore++ }
    
    $percentage = ($totalScore / 3) * 100
    
    Write-Host "📊 RESUMEN:" -ForegroundColor Magenta
    Write-Host "  Sistema: " -NoNewline
    Write-Host $(if ($systemOk) { "✅" } else { "❌" }) -ForegroundColor $(if ($systemOk) { "Green" } else { "Red" })
    Write-Host "  Proyecto: " -NoNewline  
    Write-Host $(if ($projectOk) { "✅" } else { "❌" }) -ForegroundColor $(if ($projectOk) { "Green" } else { "Red" })
    Write-Host "  Scripts: " -NoNewline
    Write-Host $(if ($scriptsOk) { "✅" } else { "❌" }) -ForegroundColor $(if ($scriptsOk) { "Green" } else { "Red" })
    
    Write-Host ""
    Write-Host "🎯 Salud del Proyecto: " -NoNewline
    if ($percentage -eq 100) {
        Write-Host "EXCELENTE (100%)" -ForegroundColor Green
    } elseif ($percentage -ge 66) {
        Write-Host "BUENO ($percentage%)" -ForegroundColor Yellow
    } else {
        Write-Host "NECESITA ATENCIÓN ($percentage%)" -ForegroundColor Red
    }
    
    return ($percentage -eq 100)
}

# EJECUCIÓN PRINCIPAL
Show-Header

if ($Help) {
    Write-Host "📋 USO:" -ForegroundColor Yellow
    Write-Host "  .\status.ps1           # Verificación completa" -ForegroundColor White
    Write-Host "  .\status.ps1 -Quick    # Verificación rápida" -ForegroundColor White
    Write-Host ""
    exit 0
}

if ($Quick) {
    Test-QuickStatus
} else {
    Test-FullStatus
}

Write-Host ""
Write-Host "🕐 Verificación completada: $(Get-Date -Format 'HH:mm:ss')" -ForegroundColor Gray