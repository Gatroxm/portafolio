# 🎯 GUSTAVO MUÑOZ - Portfolio & Development Ecosystem

### 🚀 Portfolio Principal (Recomendado)
```bash
# ¡Método más rápido con script unificado!
.\portfolio.ps1

# O paso a paso:
npm install              # Instalar dependencias
npm run dev              # Servidor desarrollo → http://localhost:5173
npm run build            # Build de producción
```

### 🔧 Verificación Rápida
```bash
# Verificar estado del proyecto
.\check.ps1

# Setup inicial si es necesario
.\setup.ps1
```

[![Portfolio Live](https://img.shields.io/badge/Portfolio-Live-success?style=flat&logo=vue.js)](https://gustavo-munoz-portfolio.netlify.app)
[![Vue.js](https://img.shields.io/badge/Vue.js-4FC08D?style=flat&logo=vue.js&logoColor=white)](https://vuejs.org/)
[![Tailwind CSS](https://img.shields.io/badge/Tailwind_CSS-38B2AC?style=flat&logo=tailwind-css&logoColor=white)](https://tailwindcss.com/)
[![Node.js](https://img.shields.io/badge/Node.js-43853D?style=flat&logo=node.js&logoColor=white)](https://nodejs.org/)
[![AWS](https://img.shields.io/badge/AWS-232F3E?style=flat&logo=amazon-aws&logoColor=white)](https://aws.amazon.com/)

> **Ecosistema completo de desarrollo** - Portfolio moderno con Vue.js 3, backend APIs con Node.js, y deployment automatizado multi-plataforma

## 🎉 ¿Qué encontrarás aquí?

Este repositorio contiene mi **ecosistema completo de desarrollo**, que incluye:
- 🌟 **Portfolio Personal**: Vue.js 3 + Tailwind CSS (ultra-moderno)
- 🔧 **APIs Backend**: Node.js + Express + MongoDB (con Swagger)
- ⚡ **Scripts de Deployment**: PowerShell para AWS, Netlify, Vercel, GitHub Pages
- 📱 **Proyectos Full-Stack**: React, Angular, Vue.js con backends completos

## 🚀 Características

- ✅ **Diseño Moderno**: Interfaz limpia y profesional
- ✅ **Responsive**: Adaptado a todos los dispositivos
- ✅ **Vue.js 3**: Usando Composition API
- ✅ **Tailwind CSS**: Estilos utilitarios modernos
- ✅ **Animaciones**: Transiciones suaves con AOS
- ✅ **Performance**: Optimizado con Vite
- ✅ **SEO Friendly**: Meta tags optimizadas

## 📋 Secciones Incluidas

### 🏠 **Hero Section**
- Presentación principal
- Stack tecnológico destacado
- Botones de acción (CTA)
- Imagen profesional con efectos

### 👨‍💻 **Sobre Mí**
- Descripción profesional
- Estadísticas de experiencia
- Timeline de trayectoria
- Logros destacados

### 🛠️ **Habilidades**
- Tecnologías por categorías (Frontend, Backend, DB)
- Iconos de tecnologías
- Barras de progreso animadas
- Nivel de competencia

### 🎯 **Proyectos Destacados**
- Project Hub (SaaS Multi-Tenant)
- App Veterinaria (Angular + Node.js)
- App Control (React + MongoDB)
- App Admin Hospitals (Vue.js)

### 🎓 **Certificaciones**
- Cursos de Udemy completados
- Skills aprendidas por curso
- Enlaces a certificados
- Estadísticas de aprendizaje

### 📞 **Contacto**
- Información de contacto
- Formulario funcional
- Enlaces a redes sociales
- Estado de disponibilidad

## 📥 **Instalación Completa del Ecosystem**

### � **Requisitos Previos**
Antes de comenzar, asegúrate de tener instalado:
- **Node.js** (v16 o superior): https://nodejs.org/
- **Git**: https://git-scm.com/
- **Angular CLI** (para AppVeterinaria): `npm install -g @angular/cli`
- **MongoDB** (opcional, para desarrollo local): https://www.mongodb.com/

### �🔄 **Paso 1: Clonar el Portfolio Principal**
```powershell
# Clonar el repositorio principal
git clone https://github.com/Gatroxm/portafolio.git
cd portafolio

# Instalar dependencias del portfolio
npm install
```

### 📦 **Paso 2: Clonar los Subproyectos (IMPORTANTE)**

> **⚠️ NOTA**: Estos proyectos NO están incluidos en este repositorio. Cada uno tiene su propio repositorio independiente y debe clonarse por separado.

#### **🏢 ProjetHub (SaaS Platform)**
```powershell
# Clonar en la carpeta ProjetHub
git clone https://github.com/Gatroxm/ProjectHub.git ProjetHub
cd ProjetHub
npm install                    # Dependencias raíz
cd frontend && npm install     # Frontend React
cd ../backend && npm install   # Backend Node.js/NestJS
cd ../..
```

#### **💉 AppControl (Health Management)**
```powershell
# Clonar en la carpeta AppControl  
git clone https://github.com/Gatroxm/AppControl.git AppControl
cd AppControl
npm install                    # Dependencias raíz
cd client && npm install       # Frontend React
cd ../server && npm install    # Backend Node.js/Express
cd ../..
```

#### **🐕 AppVeterinaria (Veterinary System)**
```powershell
# Clonar en la carpeta AppVeterinaria
git clone https://github.com/Gatroxm/AppVeterinaria.git AppVeterinaria
cd AppVeterinaria/frontend && npm install    # Frontend Angular
cd ../backend && npm install                 # Backend Node.js
cd ../..
```

### 🔧 **Paso 3: Verificar Instalación**
```powershell
# Verificar que todas las carpetas existen
dir | Where-Object {$_.Name -match "Projet|App"}

# Debería mostrar:
# - ProjetHub/
# - AppControl/
# - AppVeterinaria/
```

### 🚀 **Paso 4: Ejecutar Todo el Ecosystem**
```powershell
# ¡Listo! Ahora ejecuta todo con un comando
.\start-all.ps1
```

### 📁 **Estructura Final Esperada**
```
portafolio/                          # ← Repositorio principal
├── src/                             # Portfolio Vue.js
├── ProjetHub/                       # ← Clonar aquí
│   ├── frontend/                    # React frontend
│   └── backend/                     # Node.js API
├── AppControl/                      # ← Clonar aquí
│   ├── client/                      # React frontend  
│   └── server/                      # Node.js API
├── AppVeterinaria/                  # ← Clonar aquí
│   ├── frontend/                    # Angular frontend
│   └── backend/                     # Node.js API
├── start-all.ps1                    # Script principal
├── check-projects.ps1               # Verificador
└── README.md                        # Esta documentación
```

### ⚡ **Instalación Rápida (Una sola línea)**
```powershell
# Para usuarios avanzados - Clonar todo automáticamente
git clone https://github.com/Gatroxm/portafolio.git && cd portafolio && git clone https://github.com/Gatroxm/ProjectHub.git ProjetHub && git clone https://github.com/Gatroxm/AppControl.git AppControl && git clone https://github.com/Gatroxm/AppVeterinaria.git AppVeterinaria && npm install
```

## ⚡ Inicio Rápido

### 🚀 **ECOSYSTEM COMPLETO** (Recomendado)
```powershell
# ¡Ejecutar TODAS las aplicaciones de una vez!
.\start-all.ps1
```

**Esto iniciará:**
- 📱 **Portfolio Principal**: http://localhost:5173 (Auto-abre)
- 🏢 **ProjetHub Frontend**: http://localhost:3000
- ⚡ **ProjetHub Backend**: http://localhost:5000 (API)
- 💉 **AppControl Frontend**: http://localhost:3001  
- 🔧 **AppControl Backend**: http://localhost:5001 (API)
- 🐕 **AppVeterinaria Frontend**: http://localhost:4200

### 📋 **COMANDOS INDIVIDUALES**

#### Portfolio Principal
```powershell
# Solo el portfolio (más rápido)
npm run dev                    # http://localhost:5173
.\open-portfolio-simple.ps1    # Abrir portfolio directamente
```

#### ProjetHub (SaaS Platform)
```powershell
cd ProjetHub
npm run dev                    # Frontend: http://localhost:3000
npm run backend:dev           # Backend API: http://localhost:5000
```

#### AppControl (Diabetes Management)
```powershell
cd AppControl  
npm run client                # Frontend: http://localhost:3001
npm run server                # Backend API: http://localhost:5001
```

#### AppVeterinaria (Veterinary Management)
```powershell
cd AppVeterinaria\frontend
ng serve --port 4200          # Frontend: http://localhost:4200
```

### 🔍 **VERIFICACIÓN Y DIAGNÓSTICO**
```powershell
# Verificar estado de todos los servicios
.\check-projects.ps1

# Reiniciar todo si hay problemas
Get-Process *node* | Stop-Process -Force
.\start-all.ps1
```

### ☁️ **DEPLOYMENT**
```powershell
# Deploy completo a múltiples plataformas
.\deploy.ps1

# Deploy específico a AWS
.\aws-deploy.ps1

# Deploy de todos los proyectos
.\master-deploy.ps1
```

## 🔄 **CI/CD con GitHub Actions y AWS**

### 🚀 **Configuración de Integración Continua**

> **💡 Concepto**: Cada vez que haces push a cualquier repositorio, se despliega automáticamente a AWS

#### **📋 Estructura CI/CD Recomendada:**

```
Portfolio Principal (este repo)
├── .github/workflows/
│   └── deploy-portfolio.yml     # Despliega a AWS S3 + CloudFront
│
ProjetHub/
├── .github/workflows/
│   ├── deploy-frontend.yml      # Despliega React a S3
│   └── deploy-backend.yml       # Despliega API a AWS ECS/EC2
│
AppControl/
├── .github/workflows/
│   ├── deploy-frontend.yml      # Despliega React a S3
│   └── deploy-backend.yml       # Despliega API a AWS ECS/EC2
│
AppVeterinaria/
├── .github/workflows/
│   ├── deploy-frontend.yml      # Despliega Angular a S3
│   └── deploy-backend.yml       # Despliega API a AWS ECS/EC2
```

#### **⚙️ Configuración AWS Required:**

1. **AWS S3** - Para frontends estáticos
2. **AWS CloudFront** - CDN para el portfolio
3. **AWS ECS/Fargate** - Para backends/APIs
4. **AWS RDS** - Base de datos MongoDB/MySQL
5. **AWS Route53** - DNS personalizado
6. **GitHub Actions** - CI/CD automatizado

#### **🔐 Secrets de GitHub Necesarios:**

```yaml
# En cada repositorio, agregar estos secrets:
AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY  
AWS_REGION
AWS_S3_BUCKET_NAME
AWS_CLOUDFRONT_DISTRIBUTION_ID
```

### 📄 **Ejemplo: GitHub Action para Portfolio**

```yaml
# .github/workflows/deploy-portfolio.yml
name: Deploy Portfolio to AWS

on:
  push:
    branches: [ master ]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v3
    
    - name: Setup Node.js
      uses: actions/setup-node@v3
      with:
        node-version: '18'
        
    - name: Install dependencies
      run: npm install
      
    - name: Build project
      run: npm run build
      
    - name: Deploy to S3
      uses: aws-actions/configure-aws-credentials@v2
      with:
        aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
        aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
        aws-region: ${{ secrets.AWS_REGION }}
        
    - name: Sync to S3
      run: |
        aws s3 sync dist/ s3://${{ secrets.AWS_S3_BUCKET_NAME }} --delete
        aws cloudfront create-invalidation --distribution-id ${{ secrets.AWS_CLOUDFRONT_DISTRIBUTION_ID }} --paths "/*"
```

### 🎯 **Workflow Recomendado:**

1. **Desarrollo Local**: `.\start-all.ps1`
2. **Git Push**: `git push origin main`
3. **Auto Deploy**: GitHub Actions → AWS
4. **Live Update**: Tu web se actualiza automáticamente

## 🌐 **Servicios y Puertos**

| **Aplicación** | **Tipo** | **Puerto** | **URL** | **Estado** |
|----------------|----------|------------|---------|------------|
| **Portfolio Principal** | Frontend (Vue.js) | 5173 | http://localhost:5173 | ✅ Principal |
| **ProjetHub Frontend** | Frontend (React) | 3000 | http://localhost:3000 | ✅ Activo |
| **ProjetHub Backend** | API (Node.js) | 5000 | http://localhost:5000 | ⚙️ Backend |
| **AppControl Frontend** | Frontend (React) | 3001 | http://localhost:3001 | ✅ Activo |
| **AppControl Backend** | API (Node.js) | 5001 | http://localhost:5001 | ⚙️ Backend |
| **AppVeterinaria** | Frontend (Angular) | 4200 | http://localhost:4200 | ✅ Activo |

### 📝 **Archivos de Configuración**
- `.env` - Configuración principal de puertos
- `ProjetHub/frontend/.env` - Config frontend ProjetHub
- `ProjetHub/backend/.env` - Config backend ProjetHub  
- `AppControl/client/.env` - Config frontend AppControl
- `AppControl/server/.env` - Config backend AppControl
- `AppVeterinaria/.env` - Config AppVeterinaria

### ⚡ **Scripts Disponibles**
- `start-all.ps1` - Iniciar todo el ecosystem
- `check-projects.ps1` - Verificar estado de servicios
- `open-portfolio-simple.ps1` - Abrir solo el portfolio
- `ecosystem-simple.ps1` - Launcher alternativo
- `ecosystem-launcher.ps1` - Launcher avanzado

### 📁 **Configuración .gitignore**

> **🔥 IMPORTANTE**: Este repositorio NO incluye las carpetas de los subproyectos

**¿Por qué?**
- ✅ **Independencia**: Cada proyecto mantiene su propio historial de Git
- ✅ **Flexibilidad**: Puedes actualizar proyectos individuales sin afectar otros
- ✅ **CI/CD**: Cada proyecto puede tener su propio pipeline de despliegue
- ✅ **Colaboración**: Diferentes equipos pueden trabajar en diferentes proyectos

**Carpetas excluidas en .gitignore:**
```gitignore
# Proyectos independientes (repositorios separados)
ProjetHub/
AppControl/
AppVeterinaria/
AppAdminHospitals/
```

**⚠️ Esto significa que:**
- Debes clonar cada proyecto por separado (ver instrucciones arriba)
- Los cambios en subproyectos no afectan este repositorio principal
- Cada proyecto mantiene su propio control de versiones
- Perfect para CI/CD independiente por proyecto

## 🛠️ Stack Tecnológico Completo

### Frontend Stack
- **Vue.js 3** - Framework con Composition API
- **Vue Router 4** - Navegación SPA moderna
- **Tailwind CSS** - Utility-first CSS framework
- **Heroicons** - Iconografía SVG moderna
- **AOS** - Animate On Scroll library
- **Vite** - Build tool ultrarrápido

### Backend Stack
- **Node.js** - Runtime de JavaScript
- **Express.js** - Framework web minimalista
- **MongoDB** - Base de datos NoSQL
- **Mongoose** - ODM para MongoDB
- **Swagger** - Documentación API automática

### DevOps & Deployment
- **PowerShell** - Scripts de automatización
- **AWS S3 + CloudFront** - Hosting y CDN
- **Netlify/Vercel** - Deployment alternativo
- **GitHub Actions** - CI/CD automatizado

## 📁 Estructura Completa del Proyecto

```
📂 GUSTAVO MUÑOZ Portfolio Ecosystem/
│
├── 🎨 PORTFOLIO PRINCIPAL (Vue.js 3 en raíz)
│   ├── src/
│   │   ├── components/
│   │   │   ├── NavBar.vue           # Navegación responsive
│   │   │   ├── HeroSection.vue      # Presentación principal
│   │   │   ├── AboutSection.vue     # Información personal
│   │   │   ├── SkillsSection.vue    # Habilidades técnicas
│   │   │   ├── ProjectsSection.vue  # Proyectos destacados
│   │   │   ├── CoursesSection.vue   # Certificaciones
│   │   │   ├── ContactSection.vue   # Formulario contacto
│   │   │   └── FooterSection.vue    # Footer con enlaces
│   │   ├── router/
│   │   │   └── index.js            # Configuración Vue Router
│   │   ├── views/
│   │   │   └── Home.vue            # Vista principal
│   │   ├── App.vue                 # Componente raíz
│   │   └── main.js                 # Punto de entrada
│   ├── index.html                  # HTML template
│   ├── package.json               # Dependencies y scripts
│   ├── vite.config.js             # Configuración Vite
│   ├── tailwind.config.js         # Configuración Tailwind
│   └── postcss.config.js          # Configuración PostCSS
│
├── � PROYECTOS ADICIONALES
│   ├── ProjetHub/                 # SaaS Multi-tenant
│   ├── AppVeterinaria/            # Sistema veterinario
│   ├── AppControl/                # App de control React
│   └── AppAdminHospitals/         # Admin hospitalario
│
├── ⚡ SCRIPTS DE AUTOMATIZACIÓN
│   ├── portfolio.ps1              # 🌟 Script principal unificado
│   ├── deploy.ps1                 # Deploy multi-plataforma
│   ├── aws-deploy.ps1            # Deploy específico AWS
│   ├── master-deploy.ps1         # Deploy todos los proyectos
│   ├── setup.ps1                 # Configuración inicial
│   └── check.ps1                 # Verificación rápida
│
└── 📚 DOCUMENTACIÓN
    ├── README.md                  # Este archivo principal
    └── DEPLOYMENT-GUIDE.md        # Guía de deployment
```

## 🎯 Scripts de Automatización Disponibles

| Script | Propósito | Comando |
|--------|-----------|---------|
| `portfolio.ps1` | **🌟 Script principal** - Todo en uno | `.\portfolio.ps1` |
| `deploy.ps1` | Deploy avanzado con opciones | `.\deploy.ps1 -Platform netlify` |
| `aws-deploy.ps1` | Deploy específico para AWS S3 | `.\aws-deploy.ps1` |
| `master-deploy.ps1` | Deploy de todos los proyectos | `.\master-deploy.ps1` |
| `quick-deploy.ps1` | Deploy rápido y simple | `.\quick-deploy.ps1` |
| `status.ps1` | Verificación de salud del proyecto | `.\status.ps1` |
| `setup.ps1` | Configuración inicial del entorno | `.\setup.ps1` |

## 🎨 Personalización

### Colores del Tema
Los colores principales se pueden modificar en `tailwind.config.js`:

```javascript
theme: {
  extend: {
    colors: {
      primary: {
        // Tu paleta de colores primarios
      },
      secondary: {
        // Tu paleta de colores secundarios
      }
    }
  }
}
```

### Contenido
El contenido se puede modificar directamente en los componentes:

- **Información personal**: `HeroSection.vue`, `AboutSection.vue`
- **Habilidades**: `SkillsSection.vue`
- **Proyectos**: `ProjectsSection.vue`
- **Cursos**: `CoursesSection.vue`
- **Contacto**: `ContactSection.vue`

## 📱 Responsive Design

El portafolio está optimizado para:
- 📱 **Mobile**: 320px - 768px
- 💻 **Tablet**: 768px - 1024px
- 🖥️ **Desktop**: 1024px+

## ⚡ Performance

- **Lazy Loading** de imágenes
- **Code Splitting** automático con Vite
- **Optimización** de assets
- **Compresión** de CSS y JS
- **Carga rápida** < 3 segundos

## 🚀 Deployment

### GitHub Pages
```bash
# 1. Build del proyecto
npm run build

# 2. Deploy a GitHub Pages
# (Configurar GitHub Actions o manual)
```

### Netlify
```bash
# 1. Conectar repositorio
# 2. Build command: npm run build
# 3. Publish directory: dist
```

### Vercel
```bash
# 1. Conectar repositorio
# 2. Framework: Vue.js
# 3. Deploy automático
```

## 🔧 Configuración Adicional

### SEO
Actualizar meta tags en `index.html`:
```html
<title>Tu Nombre - Desarrollador Full Stack</title>
<meta name="description" content="Tu descripción profesional">
```

### Analytics
Agregar Google Analytics o similar en `index.html`.

### Formulario de Contacto
El formulario actual es un demo. Para funcionalidad real, integrar con:
- EmailJS
- Netlify Forms
- Formspree
- Backend personalizado

## 🚀 Ecosistema de Proyectos

Este repositorio también incluye otros proyectos complementarios:

### 🔧 Job Scraper API
- **Ubicación**: `./jobscraper-backend/`
- **Stack**: Node.js + Express + MongoDB + Swagger
- **Funciones**: API para scraping de portales de trabajo
- **Deploy**: Compatible con Render y Railway

### 🏥 Sistema Veterinario
- **Stack**: Angular + Node.js + PostgreSQL
- **Características**: Gestión de mascotas, citas, historiales
- **Estado**: En desarrollo

### 🏢 Sistema Hospitalario Admin
- **Stack**: Vue.js + Node.js + MySQL
- **Características**: Gestión de personal, pacientes, inventario
- **Estado**: En desarrollo

## 📈 Roadmap

- [ ] ✅ Portfolio Vue.js 3 (Completado)
- [ ] ✅ Deploy automation scripts (Completado)
- [ ] ✅ Multi-platform deployment (Completado)
- [ ] 🔄 PWA capabilities (En progreso)
- [ ] 🔄 Dark/Light theme toggle (En progreso)
- [ ] 📱 Mobile app con Capacitor (Planeado)
- [ ] 🎨 Customización de temas (Planeado)
- [ ] 📊 Dashboard de analytics (Planeado)

## 🤝 Contribución

¿Quieres contribuir? ¡Perfecto!

## 🚨 **Troubleshooting**

### **Problema: Puertos ocupados**
```powershell
# Detener todos los procesos Node.js
Get-Process *node* | Stop-Process -Force
```

### **Problema: Un servicio no inicia**
```powershell
# Verificar estado individual
.\check-projects.ps1

# Reinstalar dependencias si es necesario
cd [nombre-proyecto]
rm -rf node_modules
npm install
```

### **Problema: Portfolio no se abre automáticamente**
```powershell
# Abrir portfolio manualmente
.\open-portfolio-simple.ps1

# O ir directo a la URL
# http://localhost:5173
```

### **Problema: Angular CLI no encontrado**
```powershell
# Instalar Angular CLI globalmente
npm install -g @angular/cli
```

## 🤝 Contribuciones

¡Las contribuciones son bienvenidas! Por favor:

1. Fork del repositorio
2. Crea tu feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abre un Pull Request

## 📄 Licencia

Este proyecto está bajo la Licencia MIT - ver el archivo [LICENSE](LICENSE) para detalles.

## 📞 Contacto

**GUSTAVO MUÑOZ** - Desarrollador Full Stack

- 📧 **Email**: tavoxpau@gmail.com  
- � **WhatsApp**: +57 313 397 69 99
- �🐙 **GitHub**: [@Gatroxm](https://github.com/Gatroxm)
- 💼 **LinkedIn**: [GUSTAVO MUÑOZ](https://www.linkedin.com/in/gustavo-adolfo-mu%C3%B1oz-reyes-a277b587/)

### 🎯 **URLs del Ecosystem en Desarrollo**
- 🌟 **Portfolio**: http://localhost:5173
- 🏢 **ProjetHub**: http://localhost:3000
- 💉 **AppControl**: http://localhost:3001
- 🐕 **AppVeterinaria**: http://localhost:4200

##  Licencia

Este proyecto está bajo la Licencia MIT - ver el archivo [LICENSE](LICENSE) para detalles.

---

<div align="center">

**⭐ Si este proyecto te ayudó, ¡dale una estrella!**

*Desarrollado con ❤️ por Gustavo Muñoz*

### 🎯 **Comando Principal para Iniciar Todo:**
```powershell
.\start-all.ps1
```
*¡Un solo comando, todo el ecosystem funcionando!*

</div>