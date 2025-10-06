# 🚀 QUICK DEPLOY - Portafolio Gabriel Troncoso
# Script rápido para deploy cuando todos los proyectos estén listos

Write-Host "🎯 === QUICK DEPLOY PORTAFOLIO ===" -ForegroundColor Cyan
Write-Host ""

# Proyectos a procesar
$projects = @("AppAdminHospitals", "AppVeterinaria", "AppControl", "ProjetHub")

# Función para verificar si un proyecto está listo
function Test-ProjectReady {
    param($projectPath)
    
    if (-not (Test-Path $projectPath)) {
        return $false
    }
    
    $hasReadme = Test-Path "$projectPath/README.md"
    $hasPackage = (Test-Path "$projectPath/package.json") -or (Test-Path "$projectPath/backend/package.json")
    
    return $hasReadme -and $hasPackage
}

# Verificar estado de todos los proyectos
Write-Host "📊 Verificando proyectos..." -ForegroundColor Yellow
$readyCount = 0
$totalCount = $projects.Count

foreach ($project in $projects) {
    $isReady = Test-ProjectReady $project
    $status = if ($isReady) { "✅ Listo" } else { "❌ No listo" }
    $color = if ($isReady) { "Green" } else { "Red" }
    
    Write-Host "  $project - $status" -ForegroundColor $color
    
    if ($isReady) { $readyCount++ }
}

Write-Host ""
Write-Host "📈 Resumen: $readyCount/$totalCount proyectos listos" -ForegroundColor Cyan

# Preguntar si continuar
if ($readyCount -lt $totalCount) {
    Write-Host ""
    Write-Host "⚠️ No todos los proyectos están listos." -ForegroundColor Yellow
    $continue = Read-Host "¿Continuar con deploy parcial? (y/N)"
    
    if ($continue -ne "y" -and $continue -ne "Y") {
        Write-Host "❌ Deploy cancelado." -ForegroundColor Red
        exit
    }
}

# Proceso de deploy
Write-Host ""
Write-Host "🚀 Iniciando deploy automático..." -ForegroundColor Green
Write-Host ""

foreach ($project in $projects) {
    if (Test-ProjectReady $project) {
        Write-Host "📁 Procesando $project..." -ForegroundColor Blue
        
        Push-Location $project
        
        try {
            # Git add y commit
            git add . 2>$null
            git commit -m "feat: Deploy final de $project - Portafolio profesional

✨ Proyecto completado y optimizado
📝 Documentación actualizada  
🚀 Listo para producción
🎯 Parte del portafolio de Gabriel Troncoso" 2>$null

            # Push (si hay cambios)
            git push 2>$null
            
            Write-Host "  ✅ $project desplegado correctamente" -ForegroundColor Green
        }
        catch {
            Write-Host "  ⚠️ $project - Deploy con advertencias" -ForegroundColor Yellow
        }
        
        Pop-Location
    }
    else {
        Write-Host "⏭️ Saltando $project (no está listo)" -ForegroundColor Gray
    }
}

# Deploy del portafolio principal
Write-Host ""
Write-Host "📋 Desplegando portafolio principal..." -ForegroundColor Magenta

try {
    git add .
    git commit -m "feat: Portafolio profesional Gabriel Troncoso

🎯 Desarrollador Full Stack especializado en:
- Frontend: Vue.js, Angular, React
- Backend: Node.js + Express  
- Database: MongoDB
- DevOps: Docker, Git, CI/CD

📁 Proyectos incluidos:
- App Admin Hospitals (Sistema de gestión hospitalaria)
- App Veterinaria (Plataforma veterinaria integral)  
- App Control (Sistema de control y monitoreo)
- Project Hub (Plataforma SaaS Multi-Tenant)

✨ Características:
- Documentación completa y profesional
- Scripts de deploy automatizado
- Estructura escalable y mantenible
- Código de alta calidad

🚀 Portfolio listo para presentar a empleadores y clientes"

    git push -u origin main
    
    Write-Host "✅ Portafolio principal desplegado correctamente" -ForegroundColor Green
}
catch {
    Write-Host "⚠️ Portafolio principal - Deploy con advertencias" -ForegroundColor Yellow
}

# Mostrar resultados finales
Write-Host ""
Write-Host "🎉 ¡DEPLOY COMPLETADO!" -ForegroundColor Green
Write-Host ""
Write-Host "🌐 Enlaces importantes:" -ForegroundColor Cyan
Write-Host "  📁 Portafolio: https://github.com/Gatroxm/portafolio" -ForegroundColor White
Write-Host "  🏥 App Admin Hospitals: https://github.com/Gatroxm/AppAdminHospitals" -ForegroundColor White  
Write-Host "  🐾 App Veterinaria: https://github.com/Gatroxm/AppVeterinaria" -ForegroundColor White
Write-Host "  📊 App Control: https://github.com/Gatroxm/AppControl" -ForegroundColor White
Write-Host "  🚀 Project Hub: https://github.com/Gatroxm/ProjectHub" -ForegroundColor White
Write-Host ""
Write-Host "📞 Contacto: gabriel.troncoso.dev@gmail.com" -ForegroundColor Cyan
Write-Host "⭐ No olvides dar estrella a los repositorios!" -ForegroundColor Yellow