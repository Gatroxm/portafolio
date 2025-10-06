# GUSTAVO MUÑOZ ECOSYSTEM - SINCRONIZACION COMPLETA
# Este script inicia todo el ecosystem de manera sincronizada

Write-Host "===============================================" -ForegroundColor Cyan
Write-Host "║                                             ║" -ForegroundColor Cyan
Write-Host "║        🌟 GUSTAVO MUÑOZ ECOSYSTEM          ║" -ForegroundColor Cyan
Write-Host "║           LAUNCHER SINCRONIZADO             ║" -ForegroundColor Cyan
Write-Host "║                                             ║" -ForegroundColor Cyan
Write-Host "===============================================" -ForegroundColor Cyan
Write-Host ""

# Variables de configuracion
$PORTFOLIO_PORT = 5173
$PROJECTHUB_PORT = 3000
$VETERINARIA_PORT = 4000
$CONTROL_PORT = 3001
$HOSPITALS_PORT = 3002

# Funcion para verificar si un puerto esta en uso
function Test-Port {
    param([int]$Port)
    try {
        $listener = [System.Net.NetworkInformation.IPGlobalProperties]::GetIPGlobalProperties()
        $ports = $listener.GetActiveTcpListeners()
        return $ports.Port -contains $Port
    }
    catch {
        return $false
    }
}

# Funcion para limpiar puertos
function Stop-AllPorts {
    Write-Host "🧹 Limpiando puertos..." -ForegroundColor Yellow
    
    $ports = @($PORTFOLIO_PORT, $PROJECTHUB_PORT, $VETERINARIA_PORT, $CONTROL_PORT, $HOSPITALS_PORT)
    
    foreach ($port in $ports) {
        if (Test-Port -Port $port) {
            Write-Host "   ⏹️  Deteniendo puerto $port..." -ForegroundColor Gray
            Get-Process | Where-Object {$_.ProcessName -like "*node*"} | 
                ForEach-Object {
                    try {
                        $connections = netstat -ano | Select-String ":$port "
                        if ($connections) {
                            Stop-Process -Id $_.Id -Force -ErrorAction SilentlyContinue
                        }
                    }
                    catch { }
                }
        }
    }
    Start-Sleep -Seconds 2
}

# Funcion para iniciar proyecto
function Start-ProjectSync {
    param(
        [string]$Name,
        [string]$Path,
        [int]$Port,
        [string]$Command,
        [int]$Delay = 3
    )
    
    Write-Host "🚀 Iniciando $Name..." -ForegroundColor Green
    Write-Host "   📂 Ruta: $Path" -ForegroundColor Gray
    Write-Host "   🌐 Puerto: $Port" -ForegroundColor Gray
    Write-Host "   ⚡ Comando: $Command" -ForegroundColor Gray
    
    try {
        if ($Path -eq ".") {
            Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$PWD'; $Command" -WindowStyle Minimized
        } else {
            $fullPath = Join-Path $PWD $Path
            if (Test-Path $fullPath) {
                Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$fullPath'; $Command" -WindowStyle Minimized
            } else {
                Write-Host "   ❌ Error: Ruta no encontrada" -ForegroundColor Red
                return $false
            }
        }
        
        Write-Host "   ✅ $Name iniciado correctamente" -ForegroundColor Green
        Start-Sleep -Seconds $Delay
        return $true
    }
    catch {
        Write-Host "   ❌ Error al iniciar $Name" -ForegroundColor Red
        return $false
    }
}

# Limpiar puertos primero
Stop-AllPorts

Write-Host "🎯 INICIANDO ECOSYSTEM SINCRONIZADO" -ForegroundColor Magenta
Write-Host ""

# Contador de proyectos iniciados
$successful = 0
$total = 5

# Iniciar proyectos en orden sincronizado
Write-Host "📱 FASE 1: Portfolio Principal" -ForegroundColor Cyan
if (Start-ProjectSync -Name "Portfolio Principal" -Path "." -Port $PORTFOLIO_PORT -Command "npm run dev" -Delay 5) {
    $successful++
}

Write-Host ""
Write-Host "🏢 FASE 2: ProjetHub" -ForegroundColor Cyan
if (Start-ProjectSync -Name "ProjetHub" -Path "ProjetHub" -Port $PROJECTHUB_PORT -Command "npm install; npm run dev -- --port $PROJECTHUB_PORT" -Delay 8) {
    $successful++
}

Write-Host ""
Write-Host "🐕 FASE 3: App Veterinaria" -ForegroundColor Cyan
if (Start-ProjectSync -Name "App Veterinaria" -Path "AppVeterinaria" -Port $VETERINARIA_PORT -Command "npm install; ng serve --port $VETERINARIA_PORT" -Delay 10) {
    $successful++
}

Write-Host ""
Write-Host "❤️  FASE 4: App Control" -ForegroundColor Cyan
if (Start-ProjectSync -Name "App Control" -Path "AppControl" -Port $CONTROL_PORT -Command "npm install; npm start" -Delay 6) {
    $successful++
}

Write-Host ""
Write-Host "🏥 FASE 5: Admin Hospitals" -ForegroundColor Cyan
if (Start-ProjectSync -Name "Admin Hospitals" -Path "AppAdminHospitals" -Port $HOSPITALS_PORT -Command "npm install; npm run dev -- --port $HOSPITALS_PORT" -Delay 8) {
    $successful++
}

Write-Host ""
Write-Host "⏳ Esperando sincronización completa..." -ForegroundColor Blue
Start-Sleep -Seconds 15

# Verificar estado final
Write-Host ""
Write-Host "📊 RESUMEN DE INICIALIZACION" -ForegroundColor Yellow
Write-Host "===============================================" -ForegroundColor Gray
Write-Host "Proyectos iniciados: $successful de $total" -ForegroundColor White

$urls = @(
    @{Name="Portfolio Principal"; URL="http://localhost:$PORTFOLIO_PORT"; Status=(Test-Port -Port $PORTFOLIO_PORT)},
    @{Name="ProjetHub"; URL="http://localhost:$PROJECTHUB_PORT"; Status=(Test-Port -Port $PROJECTHUB_PORT)},
    @{Name="App Veterinaria"; URL="http://localhost:$VETERINARIA_PORT"; Status=(Test-Port -Port $VETERINARIA_PORT)},
    @{Name="App Control"; URL="http://localhost:$CONTROL_PORT"; Status=(Test-Port -Port $CONTROL_PORT)},
    @{Name="Admin Hospitals"; URL="http://localhost:$HOSPITALS_PORT"; Status=(Test-Port -Port $HOSPITALS_PORT)}
)

Write-Host ""
Write-Host "🌐 URLS DISPONIBLES:" -ForegroundColor Magenta
foreach ($url in $urls) {
    $status = if ($url.Status) { "✅ ACTIVO" } else { "⏳ CARGANDO" }
    $color = if ($url.Status) { "Green" } else { "Yellow" }
    Write-Host "   $($url.Name): $($url.URL) - $status" -ForegroundColor $color
}

Write-Host ""
Write-Host "🎯 INSTRUCCIONES DE USO:" -ForegroundColor Yellow
Write-Host "===============================================" -ForegroundColor Gray
Write-Host "1. Espera 1-2 minutos para carga completa" -ForegroundColor White
Write-Host "2. Abre: http://localhost:$PORTFOLIO_PORT" -ForegroundColor White
Write-Host "3. Navega a 'Proyectos Destacados'" -ForegroundColor White
Write-Host "4. Usa los botones 'En Vivo' verdes" -ForegroundColor White
Write-Host "5. Cada boton abre el proyecto correspondiente" -ForegroundColor White

Write-Host ""
Write-Host "✨ ECOSYSTEM DE GUSTAVO MUÑOZ SINCRONIZADO!" -ForegroundColor Green
Write-Host "===============================================" -ForegroundColor Gray