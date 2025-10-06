# GUSTAVO MUÑOZ - ABRIR PORTFOLIO PRINCIPAL
Write-Host "ABRIENDO PORTFOLIO DE GUSTAVO MUÑOZ" -ForegroundColor Cyan
Write-Host "====================================" -ForegroundColor Gray
Write-Host ""

# Verificar que el portfolio esté corriendo
$portfolioRunning = Test-NetConnection -ComputerName localhost -Port 5173 -WarningAction SilentlyContinue

if ($portfolioRunning.TcpTestSucceeded) {
    Write-Host "✅ Portfolio detectado en puerto 5173" -ForegroundColor Green
    Write-Host "🌐 Abriendo http://localhost:5173" -ForegroundColor Yellow
    Write-Host ""
    
    # Abrir en el navegador predeterminado
    Start-Process "http://localhost:5173"
    
    Write-Host "📋 URLs DISPONIBLES:" -ForegroundColor Magenta
    Write-Host "   📱 Portfolio Principal: http://localhost:5173" -ForegroundColor White
    Write-Host "   🏢 ProjetHub: http://localhost:3000" -ForegroundColor White
    Write-Host "   💉 AppControl: http://localhost:3001" -ForegroundColor White
    Write-Host "   🐕 AppVeterinaria: http://localhost:4200" -ForegroundColor White
    Write-Host ""
    Write-Host "💡 CONSEJO: Guarda http://localhost:5173 como favorito" -ForegroundColor Yellow
    
} else {
    Write-Host "❌ Portfolio no está corriendo en puerto 5173" -ForegroundColor Red
    Write-Host "🔄 Ejecuta: .\start-all.ps1" -ForegroundColor Yellow
}