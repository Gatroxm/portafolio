# GUSTAVO MUÑOZ - VERIFICADOR DE PROYECTOS
Write-Host "VERIFICANDO ESTADO DE PROYECTOS" -ForegroundColor Cyan
Write-Host "================================" -ForegroundColor Gray
Write-Host ""

function Test-Port {
    param([int]$Port)
    try {
        $connection = Test-NetConnection -ComputerName localhost -Port $Port -WarningAction SilentlyContinue
        return $connection.TcpTestSucceeded
    } catch {
        return $false
    }
}

$projects = @(
    @{Name="Portfolio Principal"; Port=5173; Type="Frontend"}
    @{Name="ProjetHub Frontend"; Port=3000; Type="Frontend"}
    @{Name="ProjetHub Backend"; Port=5000; Type="Backend"}
    @{Name="AppControl Frontend"; Port=3001; Type="Frontend"}
    @{Name="AppControl Backend"; Port=5001; Type="Backend"}
    @{Name="AppVeterinaria Frontend"; Port=4200; Type="Frontend"}
)

Write-Host "ESTADO DE PUERTOS:" -ForegroundColor Yellow
foreach ($project in $projects) {
    $isRunning = Test-Port -Port $project.Port
    $status = if ($isRunning) { "ACTIVO" } else { "INACTIVO" }
    $color = if ($isRunning) { "Green" } else { "Red" }
    $typeColor = if ($project.Type -eq "Frontend") { "Cyan" } else { "Yellow" }
    
    Write-Host "   [$($project.Type)] " -NoNewline -ForegroundColor $typeColor
    Write-Host "$($project.Name) (puerto $($project.Port)): " -NoNewline -ForegroundColor White
    Write-Host $status -ForegroundColor $color
    
    if ($isRunning -and $project.Type -eq "Frontend") {
        Write-Host "     URL: http://localhost:$($project.Port)" -ForegroundColor Gray
    }
}

Write-Host ""
Write-Host "PROCESOS NODE.JS ACTIVOS:" -ForegroundColor Yellow
$nodeProcesses = Get-Process | Where-Object {$_.ProcessName -like "*node*"} | Select-Object Id, ProcessName, CPU
if ($nodeProcesses) {
    $nodeProcesses | Format-Table -AutoSize
} else {
    Write-Host "   No hay procesos Node.js ejecutandose" -ForegroundColor Red
}

Write-Host ""
Write-Host "COMANDOS UTILES:" -ForegroundColor Magenta
Write-Host "   Iniciar todos: .\start-all.ps1" -ForegroundColor White
Write-Host "   Solo portfolio: npm run dev" -ForegroundColor White
Write-Host "   Matar procesos: Get-Process *node* | Stop-Process -Force" -ForegroundColor White