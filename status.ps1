# 🔍 PORTFOLIO STATUS CHECK
# Script para verificar el estado completo del portfolio

param(
    [switch]$Quick,
    [switch]$Help
)

function Show-Header {
    Clear-Host
    Write-Host "╔══════════════════════════════════════════════════════════════════╗" -ForegroundColor Blue
    Write-Host "║                      🔍 PORTFOLIO STATUS                        ║" -ForegroundColor Blue
    Write-Host "║                   Gabriel Troncoso - Health Check               ║" -ForegroundColor Blue
    Write-Host "╚══════════════════════════════════════════════════════════════════╝" -ForegroundColor Blue
    Write-Host ""
}

function Test-SystemRequirements {
    Write-Host "🖥️  REQUISITOS DEL SISTEMA" -ForegroundColor Cyan
    Write-Host "════════════════════════════" -ForegroundColor Gray
    
    $requirements = @(
        @{ Name = "Node.js"; Command = "node"; Version = "--version"; MinVersion = "16" }
        @{ Name = "NPM"; Command = "npm"; Version = "--version"; MinVersion = "7" }
        @{ Name = "Git"; Command = "git"; Version = "--version"; MinVersion = "2" }
        @{ Name = "PowerShell"; Command = "powershell"; Version = "`$PSVersionTable.PSVersion.Major"; MinVersion = "5" }
    )
    
    $allPassed = $true
    
    foreach ($req in $requirements) {
        Write-Host "  Testing $($req.Name)..." -NoNewline
        
        if (Get-Command $req.Command -ErrorAction SilentlyContinue) {
            try {
                if ($req.Command -eq "powershell") {
                    $version = $PSVersionTable.PSVersion.Major
                }
                else {
                    $versionOutput = & $req.Command $req.Version.Split(' ') 2>$null
                    $version = $versionOutput | Select-Object -First 1
                }
                
                Write-Host " ✅ $version" -ForegroundColor Green
            }
            catch {
                Write-Host " ⚠️  Instalado (versión desconocida)" -ForegroundColor Yellow
            }
        }
        else {
            Write-Host " ❌ No instalado" -ForegroundColor Red
            $allPassed = $false
        }
    }
    
    Write-Host ""
    return $allPassed
}

function Test-ProjectStructure {
    Write-Host "📁 ESTRUCTURA DEL PROYECTO" -ForegroundColor Cyan
    Write-Host "════════════════════════════" -ForegroundColor Gray
    
    $criticalFiles = @(
        @{ Path = "package.json"; Type = "Config"; Critical = $true }
        @{ Path = "vite.config.js"; Type = "Config"; Critical = $true }
        @{ Path = "tailwind.config.js"; Type = "Config"; Critical = $true }
        @{ Path = "src/App.vue"; Type = "Vue"; Critical = $true }
        @{ Path = "src/main.js"; Type = "Vue"; Critical = $true }
        @{ Path = "index.html"; Type = "HTML"; Critical = $true }
        @{ Path = "src/components"; Type = "Directory"; Critical = $true }
        @{ Path = "node_modules"; Type = "Directory"; Critical = $false }
        @{ Path = "dist"; Type = "Directory"; Critical = $false }
    )
    
    $allCriticalPresent = $true
    
    foreach ($file in $criticalFiles) {
        $exists = Test-Path $file.Path
        $symbol = if ($exists) { "✅" } else { if ($file.Critical) { "❌" } else { "⚪" } }
        $color = if ($exists) { "Green" } else { if ($file.Critical) { "Red" } else { "Gray" } }
        $status = if ($exists) { "Presente" } else { if ($file.Critical) { "FALTANTE" } else { "Opcional" } }
        
        Write-Host "  $symbol $($file.Path) (" -NoNewline
        Write-Host "$status" -ForegroundColor $color -NoNewline
        Write-Host ")"
        
        if (-not $exists -and $file.Critical) {
            $allCriticalPresent = $false
        }
    }
    
    Write-Host ""
    return $allCriticalPresent
}

function Test-Dependencies {
    Write-Host "📦 DEPENDENCIAS" -ForegroundColor Cyan
    Write-Host "════════════════" -ForegroundColor Gray
    
    if (-not (Test-Path "package.json")) {
        Write-Host "  ❌ package.json no encontrado" -ForegroundColor Red
        Write-Host ""
        return $false
    }
    
    $package = Get-Content "package.json" | ConvertFrom-Json
    
    # Verificar dependencias principales
    $mainDeps = @("vue", "vue-router", "vite")
    $devDeps = @("@vitejs/plugin-vue", "tailwindcss", "postcss", "autoprefixer")
    
    Write-Host "  Dependencias principales:" -ForegroundColor Yellow
    foreach ($dep in $mainDeps) {
        if ($package.dependencies.$dep) {
            Write-Host "    ✅ $dep ($($package.dependencies.$dep))" -ForegroundColor Green
        }
        elseif ($package.devDependencies.$dep) {
            Write-Host "    ✅ $dep ($($package.devDependencies.$dep)) [dev]" -ForegroundColor Green
        }
        else {
            Write-Host "    ❌ $dep - FALTANTE" -ForegroundColor Red
        }
    }
    
    Write-Host "  Dependencias de desarrollo:" -ForegroundColor Yellow
    foreach ($dep in $devDeps) {
        if ($package.devDependencies.$dep) {
            Write-Host "    ✅ $dep ($($package.devDependencies.$dep))" -ForegroundColor Green
        }
        elseif ($package.dependencies.$dep) {
            Write-Host "    ✅ $dep ($($package.dependencies.$dep)) [prod]" -ForegroundColor Green
        }
        else {
            Write-Host "    ⚠️  $dep - opcional" -ForegroundColor Yellow
        }
    }
    
    # Verificar node_modules
    if (Test-Path "node_modules") {
        $nodeModulesCount = (Get-ChildItem "node_modules" -Directory).Count
        Write-Host "  📁 node_modules: $nodeModulesCount paquetes instalados" -ForegroundColor Green
    }
    else {
        Write-Host "  ❌ node_modules no encontrado - ejecutar 'npm install'" -ForegroundColor Red
    }
    
    Write-Host ""
    return $true
}

function Test-Scripts {
    Write-Host "⚙️  SCRIPTS DISPONIBLES" -ForegroundColor Cyan
    Write-Host "════════════════════════" -ForegroundColor Gray
    
    $scripts = @(
        @{ Name = "portfolio.ps1"; Description = "Script principal unificado"; Critical = $true }
        @{ Name = "deploy.ps1"; Description = "Deploy multi-plataforma"; Critical = $false }
        @{ Name = "aws-deploy.ps1"; Description = "Deploy específico AWS"; Critical = $false }
        @{ Name = "setup.ps1"; Description = "Setup inicial"; Critical = $false }
    )
    
    foreach ($script in $scripts) {
        $exists = Test-Path $script.Name
        $symbol = if ($exists) { "✅" } else { if ($script.Critical) { "❌" } else { "⚪" } }
        $color = if ($exists) { "Green" } else { if ($script.Critical) { "Red" } else { "Gray" } }
        
        Write-Host "  $symbol $($script.Name)" -ForegroundColor $color
        Write-Host "      $($script.Description)" -ForegroundColor Gray
    }
    
    # Verificar scripts de package.json
    if (Test-Path "package.json") {
        $package = Get-Content "package.json" | ConvertFrom-Json
        Write-Host ""
        Write-Host "  NPM Scripts disponibles:" -ForegroundColor Yellow
        if ($package.scripts) {
            $package.scripts.PSObject.Properties | ForEach-Object {
                Write-Host "    📜 npm run $($_.Name)" -ForegroundColor Cyan
            }
        }
    }
    
    Write-Host ""
    return $true
}

function Test-BuildCapability {
    Write-Host "🔨 CAPACIDAD DE BUILD" -ForegroundColor Cyan
    Write-Host "═══════════════════════" -ForegroundColor Gray
    
    if (-not (Test-Path "node_modules")) {
        Write-Host "  ❌ node_modules faltante - no se puede construir" -ForegroundColor Red
        Write-Host ""
        return $false
    }
    
    Write-Host "  🔄 Probando build..." -NoNewline
    
    try {
        # Intentar un build de prueba rápido
        $output = npm run build 2>&1
        if ($LASTEXITCODE -eq 0) {
            Write-Host " ✅ Build exitoso" -ForegroundColor Green
            
            if (Test-Path "dist") {
                $distFiles = Get-ChildItem -Recurse "dist" | Where-Object { -not $_.PSIsContainer }
                $totalSize = ($distFiles | Measure-Object -Property Length -Sum).Sum / 1MB
                $sizeFormatted = [math]::Round($totalSize, 2)
                Write-Host "    📊 $($distFiles.Count) archivos generados ($sizeFormatted MB)" -ForegroundColor Cyan
            }
        }
        else {
            Write-Host " ❌ Build falló" -ForegroundColor Red
            Write-Host "    Error: $($output | Select-Object -Last 3)" -ForegroundColor Red
        }
    }
    catch {
        Write-Host " ❌ Error ejecutando build" -ForegroundColor Red
    }
    
    Write-Host ""
    return $LASTEXITCODE -eq 0
}

function Show-HealthSummary($systemOk, $structureOk, $depsOk, $scriptsOk, $buildOk) {
    Write-Host "📋 RESUMEN DE SALUD DEL PROYECTO" -ForegroundColor Magenta
    Write-Host "═══════════════════════════════════" -ForegroundColor Gray
    
    $checks = @(
        @{ Name = "Requisitos del Sistema"; Status = $systemOk }
        @{ Name = "Estructura del Proyecto"; Status = $structureOk }
        @{ Name = "Dependencias"; Status = $depsOk }
        @{ Name = "Scripts"; Status = $scriptsOk }
        @{ Name = "Capacidad de Build"; Status = $buildOk }
    )
    
    $passedChecks = 0
    $totalChecks = $checks.Count
    
    foreach ($check in $checks) {
        $symbol = if ($check.Status) { "✅" } else { "❌" }
        $color = if ($check.Status) { "Green" } else { "Red" }
        Write-Host "  $symbol $($check.Name)" -ForegroundColor $color
        if ($check.Status) { $passedChecks++ }
    }
    
    Write-Host ""
    Write-Host "  📊 Resultado: $passedChecks/$totalChecks checks pasados" -ForegroundColor Cyan
    
    $percentage = ($passedChecks / $totalChecks) * 100
    $healthColor = if ($percentage -eq 100) { "Green" } elseif ($percentage -ge 80) { "Yellow" } else { "Red" }
    $healthStatus = if ($percentage -eq 100) { "EXCELENTE" } elseif ($percentage -ge 80) { "BUENO" } else { "NECESITA ATENCIÓN" }
    
    Write-Host "  🎯 Estado de Salud: " -NoNewline
    Write-Host "$healthStatus ($([math]::Round($percentage))%)" -ForegroundColor $healthColor
    
    Write-Host ""
    
    if ($percentage -lt 100) {
        Write-Host "🔧 ACCIONES RECOMENDADAS:" -ForegroundColor Yellow
        if (-not $systemOk) {
            Write-Host "  • Instalar herramientas faltantes del sistema" -ForegroundColor White
        }
        if (-not $structureOk) {
            Write-Host "  • Verificar archivos críticos del proyecto" -ForegroundColor White
        }
        if (-not $depsOk) {
            Write-Host "  • Ejecutar: npm install" -ForegroundColor White
        }
        if (-not $buildOk) {
            Write-Host "  • Revisar errores de build y dependencias" -ForegroundColor White
        }
        Write-Host ""
    }
    else {
        Write-Host "🎉 ¡Todo está perfecto! Listo para desarrollo y deploy." -ForegroundColor Green
        Write-Host ""
        Write-Host "🚀 PRÓXIMOS PASOS SUGERIDOS:" -ForegroundColor Cyan
        Write-Host "  • .\portfolio.ps1 dev              # Iniciar desarrollo" -ForegroundColor White
        Write-Host "  • .\portfolio.ps1 deploy-netlify   # Deploy a Netlify" -ForegroundColor White
        Write-Host ""
    }
}

# EJECUCIÓN PRINCIPAL
Show-Header

if ($Help) {
    Write-Host "📋 USO:" -ForegroundColor Yellow
    Write-Host "  .\status.ps1           # Verificación completa" -ForegroundColor White
    Write-Host "  .\status.ps1 -Quick    # Verificación rápida" -ForegroundColor White
    Write-Host "  .\status.ps1 -Detailed # Verificación detallada" -ForegroundColor White
    Write-Host ""
    exit 0
}

if ($Quick) {
    Write-Host "⚡ VERIFICACIÓN RÁPIDA" -ForegroundColor Yellow
    Write-Host ""
    
    $nodeOk = Get-Command "node" -ErrorAction SilentlyContinue
    $packageOk = Test-Path "package.json"
    $nodeModulesOk = Test-Path "node_modules"
    
    Write-Host "Node.js: " -NoNewline
    Write-Host $(if ($nodeOk) { "✅" } else { "❌" }) -ForegroundColor $(if ($nodeOk) { "Green" } else { "Red" })
    
    Write-Host "package.json: " -NoNewline  
    Write-Host $(if ($packageOk) { "✅" } else { "❌" }) -ForegroundColor $(if ($packageOk) { "Green" } else { "Red" })
    
    Write-Host "node_modules: " -NoNewline
    Write-Host $(if ($nodeModulesOk) { "✅" } else { "❌" }) -ForegroundColor $(if ($nodeModulesOk) { "Green" } else { "Red" })
    
    $allOk = $nodeOk -and $packageOk -and $nodeModulesOk
    Write-Host ""
    Write-Host "Estado: " -NoNewline
    Write-Host $(if ($allOk) { "✅ LISTO" } else { "❌ NECESITA CONFIGURACIÓN" }) -ForegroundColor $(if ($allOk) { "Green" } else { "Red" })
    
    exit 0
}

# Verificación completa
$systemOk = Test-SystemRequirements
$structureOk = Test-ProjectStructure  
$depsOk = Test-Dependencies
$scriptsOk = Test-Scripts

$buildOk = $false
if ($systemOk -and $structureOk -and $depsOk) {
    $buildOk = Test-BuildCapability
}

Show-HealthSummary $systemOk $structureOk $depsOk $scriptsOk $buildOk

Write-Host "🕐 Verificación completada: $(Get-Date -Format 'HH:mm:ss')" -ForegroundColor Gray