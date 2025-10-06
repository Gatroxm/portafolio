# 📋 GUÍA DE DEPLOYMENT - Portafolio Gabriel Troncoso

Este documento explica cómo usar todos los scripts de automatización del portafolio.

---

## 🎯 Scripts Disponibles

### 1. `portfolio-setup.ps1` - Script de Configuración
**Uso:** Gestión interactiva del portafolio
```powershell
.\portfolio-setup.ps1
```
**Funciones:**
- ✅ Verificación de prerrequisitos
- 📊 Estado de proyectos  
- 📖 Abrir documentación
- 🌐 Enlaces rápidos a GitHub

---

### 2. `master-deploy.ps1` - Deploy Completo Avanzado
**Uso:** Deploy completo con análisis detallado
```powershell
# Deploy completo automático
.\master-deploy.ps1 -FullDeploy

# Solo verificar estado
.\master-deploy.ps1 -CheckOnly

# Solo build de proyectos
.\master-deploy.ps1 -BuildAll

# Solo push a GitHub (proyectos listos)
.\master-deploy.ps1 -PushToGitHub
```

**Funciones avanzadas:**
- 🔍 Análisis completo de estructura
- 📦 Instalación automática de dependencias
- 🔨 Build optimizado por proyecto
- 🚀 Deploy inteligente a GitHub
- 📊 Reportes detallados de estado

---

### 3. `quick-deploy.ps1` - Deploy Rápido
**Uso:** Deploy rápido cuando todo está listo
```powershell
.\quick-deploy.ps1
```
**Ideal para:**
- ✅ Deploy final cuando todos los proyectos estén terminados
- 🚀 Actualización rápida del portafolio
- 📝 Commit y push automático

---

## 🚀 Flujo de Trabajo Recomendado

### Durante el Desarrollo
```powershell
# 1. Verificar estado actual
.\portfolio-setup.ps1

# 2. Análisis detallado si necesario
.\master-deploy.ps1 -CheckOnly
```

### Cuando Proyectos Estén Listos
```powershell
# 3. Deploy completo con verificaciones
.\master-deploy.ps1 -FullDeploy

# O deploy rápido si todo está verificado
.\quick-deploy.ps1
```

---

## 📋 Checklist Antes del Deploy Final

### Por cada proyecto (AppAdminHospitals, AppVeterinaria, AppControl, ProjetHub):

#### ✅ Estructura Básica
- [ ] Carpeta del proyecto existe
- [ ] `README.md` actualizado y completo
- [ ] `package.json` presente (root o backend)
- [ ] Estructura backend configurada
- [ ] Estructura frontend configurada

#### ✅ Configuración
- [ ] Variables de entorno configuradas (`.env`)
- [ ] Dependencias instaladas (`node_modules`)
- [ ] Scripts de build funcionando
- [ ] Repositorio Git inicializado

#### ✅ Funcionalidad
- [ ] Backend ejecutándose correctamente
- [ ] Frontend compilando sin errores
- [ ] Base de datos conectada
- [ ] APIs respondiendo correctamente

#### ✅ Documentación
- [ ] README con instalación clara
- [ ] Endpoints API documentados
- [ ] Screenshots o demos incluidos
- [ ] Tecnologías y stack detallados

---

## 🎯 Comandos de Emergencia

### Si algo falla durante el deploy:
```powershell
# Revisar estado de Git
git status

# Deshacer último commit (si es necesario)
git reset --soft HEAD~1

# Forzar push (usar con cuidado)
git push --force-with-lease

# Limpiar y reinstalar dependencias
Remove-Item -Recurse -Force node_modules
npm install
```

### Verificación manual de proyectos:
```powershell
# Verificar estructura de un proyecto
Get-ChildItem -Recurse -Directory | Select Name

# Verificar package.json
Get-Content package.json | ConvertFrom-Json | Select name, version, scripts

# Test rápido de endpoints (si hay servidor)
Invoke-WebRequest -Uri "http://localhost:3000/api/health" -Method GET
```

---

## 🌐 URLs del Portafolio Final

Una vez completado el deploy, estos serán los enlaces:

- **🎯 Portafolio Principal:** `https://github.com/Gatroxm/portafolio`
- **🏥 App Admin Hospitals:** `https://github.com/Gatroxm/AppAdminHospitals`
- **🐾 App Veterinaria:** `https://github.com/Gatroxm/AppVeterinaria`
- **📊 App Control:** `https://github.com/Gatroxm/AppControl`
- **🚀 Project Hub:** `https://github.com/Gatroxm/ProjectHub`

---

## 📞 Soporte

Si tienes problemas con algún script:

1. **Verifica prerrequisitos:** Node.js, Git, npm instalados
2. **Ejecuta desde PowerShell como Administrador** si hay problemas de permisos
3. **Revisa los logs** en la consola para errores específicos
4. **Verifica conectividad** a GitHub y MongoDB

**Contacto:** gabriel.troncoso.dev@gmail.com

---

## 🎉 ¡Listo para el Éxito!

Con estos scripts, tu portafolio estará completamente automatizado y listo para impresionar a empleadores y clientes. 

**¡Dale estrella a todos los repositorios y comparte tu increíble trabajo!** ⭐