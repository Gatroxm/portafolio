# 🏥 App Admin Hospitals
*Sistema Integral de Gestión Hospitalaria*

<div align="center">

![Status](https://img.shields.io/badge/Status-En%20Desarrollo-orange?style=for-the-badge)
![Vue.js](https://img.shields.io/badge/Vue.js-4FC08D?style=flat&logo=vue.js&logoColor=white)
![Node.js](https://img.shields.io/badge/Node.js-339933?style=flat&logo=node.js&logoColor=white)
![MongoDB](https://img.shields.io/badge/MongoDB-47A248?style=flat&logo=mongodb&logoColor=white)

</div>

---

## 📋 Descripción

**App Admin Hospitals** es un sistema integral diseñado para la gestión completa de hospitales y centros médicos. La plataforma centraliza toda la información hospitalaria, optimizando procesos administrativos y clínicos para mejorar la eficiencia operativa y la atención al paciente.

---

## ✨ Funcionalidades Principales

### 👥 **Gestión de Pacientes**
- ✅ Registro completo de pacientes con datos demográficos
- ✅ Historial médico digital centralizado
- ✅ Seguimiento de alergias y condiciones médicas
- ✅ Sistema de búsqueda avanzada de pacientes
- ✅ Gestión de contactos de emergencia

### 📅 **Sistema de Citas Médicas**
- ✅ Programación de citas por especialidad
- ✅ Calendario médico integrado
- ✅ Recordatorios automáticos (SMS/Email)
- ✅ Gestión de disponibilidad de médicos
- ✅ Lista de espera inteligente

### 👨‍⚕️ **Gestión de Personal Médico**
- ✅ Perfiles médicos con especialidades
- ✅ Horarios y turnos de trabajo
- ✅ Control de credenciales médicas
- ✅ Estadísticas de rendimiento
- ✅ Sistema de notificaciones interno

### 💊 **Inventario Médico**
- ✅ Control de medicamentos y suministros
- ✅ Alertas de stock mínimo
- ✅ Gestión de proveedores
- ✅ Trazabilidad de lotes y vencimientos
- ✅ Reportes de consumo

### 📊 **Dashboard Administrativo**
- ✅ Métricas en tiempo real
- ✅ Reportes financieros
- ✅ Análisis de ocupación
- ✅ KPIs hospitalarios
- ✅ Gráficos interactivos

---

## 🏗️ Arquitectura Tecnológica

### Frontend
- **Framework**: Vue.js 3 + Composition API
- **State Management**: Pinia
- **Routing**: Vue Router 4
- **UI Framework**: Vuetify 3 / Tailwind CSS
- **HTTP Client**: Axios
- **Validación**: VeeValidate + Yup

### Backend
- **Runtime**: Node.js 18+
- **Framework**: Express.js
- **Database**: MongoDB + Mongoose
- **Authentication**: JWT + bcrypt
- **Validation**: Joi / express-validator
- **File Upload**: Multer + Cloudinary

### Base de Datos
- **Base de datos**: MongoDB Atlas
- **ODM**: Mongoose
- **Características**:
  - Esquemas relacionales optimizados
  - Índices para consultas rápidas
  - Validaciones a nivel de esquema
  - Middleware de auditoria

---

## 📁 Estructura del Proyecto

```
AppAdminHospitals/
├── frontend/                    # Aplicación Vue.js
│   ├── src/
│   │   ├── components/         # Componentes reutilizables
│   │   ├── views/             # Páginas principales
│   │   ├── store/             # Gestión de estado (Pinia)
│   │   ├── router/            # Configuración de rutas
│   │   ├── services/          # Servicios API
│   │   └── utils/             # Utilidades
│   ├── public/
│   └── package.json
├── backend/                     # API Node.js
│   ├── src/
│   │   ├── controllers/       # Controladores de rutas
│   │   ├── models/            # Modelos de MongoDB
│   │   ├── routes/            # Definición de rutas
│   │   ├── middleware/        # Middleware personalizado
│   │   ├── services/          # Lógica de negocio
│   │   └── utils/             # Utilidades del servidor
│   └── package.json
└── docs/                       # Documentación del proyecto
```

---

## 🚀 Instalación y Configuración

### Prerrequisitos
- Node.js 18+
- MongoDB (local o Atlas)
- npm o yarn
- Git

### Instalación Rápida

```bash
# 1. Clonar el repositorio
git clone https://github.com/Gatroxm/AppAdminHospitals.git
cd AppAdminHospitals

# 2. Instalar dependencias del backend
cd backend
npm install

# 3. Configurar variables de entorno
cp .env.example .env
# Editar .env con tus configuraciones

# 4. Instalar dependencias del frontend
cd ../frontend
npm install

# 5. Iniciar el desarrollo
npm run dev
```

### Variables de Entorno

```env
# Backend (.env)
NODE_ENV=development
PORT=3000
MONGO_URI=mongodb://localhost:27017/hospital_admin
JWT_SECRET=tu_secret_super_seguro
JWT_EXPIRE=7d

# Cloudinary (opcional)
CLOUDINARY_CLOUD_NAME=tu_cloud_name
CLOUDINARY_API_KEY=tu_api_key
CLOUDINARY_API_SECRET=tu_api_secret

# Email (opcional)
SMTP_HOST=smtp.gmail.com
SMTP_PORT=587
SMTP_USER=tu_email@gmail.com
SMTP_PASS=tu_password
```

---

## 📊 Modelos de Datos

### Paciente
```javascript
{
  _id: ObjectId,
  numeroHistoria: String,
  datosPersonales: {
    nombre: String,
    apellidos: String,
    cedula: String,
    fechaNacimiento: Date,
    genero: String,
    telefono: String,
    email: String,
    direccion: Object
  },
  historialMedico: [{
    fecha: Date,
    medico: ObjectId,
    diagnostico: String,
    tratamiento: String,
    medicamentos: Array
  }],
  alergias: [String],
  contactosEmergencia: [Object],
  estadoActual: String,
  fechaRegistro: Date
}
```

### Cita Médica
```javascript
{
  _id: ObjectId,
  paciente: ObjectId,
  medico: ObjectId,
  fecha: Date,
  hora: String,
  especialidad: String,
  motivo: String,
  estado: String, // programada, confirmada, completada, cancelada
  observaciones: String,
  fechaCreacion: Date
}
```

---

## 🌐 API Endpoints

### Pacientes
```
GET    /api/patients           # Listar pacientes
POST   /api/patients           # Crear paciente
GET    /api/patients/:id       # Obtener paciente
PUT    /api/patients/:id       # Actualizar paciente
DELETE /api/patients/:id       # Eliminar paciente
```

### Citas
```
GET    /api/appointments       # Listar citas
POST   /api/appointments       # Crear cita
GET    /api/appointments/:id   # Obtener cita
PUT    /api/appointments/:id   # Actualizar cita
DELETE /api/appointments/:id   # Cancelar cita
```

### Médicos
```
GET    /api/doctors           # Listar médicos
POST   /api/doctors           # Crear médico
GET    /api/doctors/:id       # Obtener médico
PUT    /api/doctors/:id       # Actualizar médico
```

---

## 🎯 Roadmap de Desarrollo

### Fase 1: Core System ✅
- [x] Autenticación y autorización
- [x] Gestión básica de pacientes
- [x] Sistema de citas médicas
- [x] Dashboard administrativo

### Fase 2: Advanced Features 🚧
- [ ] Historial médico completo
- [ ] Sistema de inventario
- [ ] Reportes avanzados
- [ ] Notificaciones push

### Fase 3: Integration & Analytics 📋
- [ ] Integración con sistemas externos
- [ ] Analytics avanzados
- [ ] API pública
- [ ] Mobile app

---

## 🤝 Contribución

1. Fork el proyecto
2. Crea una rama feature (`git checkout -b feature/NuevaFuncionalidad`)
3. Commit tus cambios (`git commit -m 'Add: Nueva funcionalidad'`)
4. Push a la rama (`git push origin feature/NuevaFuncionalidad`)
5. Abre un Pull Request

---

## 📄 Licencia

Este proyecto está bajo la Licencia MIT - ver el archivo [LICENSE](LICENSE) para más detalles.

---

## 📞 Contacto

**Gabriel Troncoso** - Desarrollador Full Stack
- 🐙 GitHub: [@Gatroxm](https://github.com/Gatroxm)
- 📧 Email: [tu-email@ejemplo.com]

---

<div align="center">

**⭐ Si te gusta este proyecto, no olvides darle una estrella ⭐**

*Desarrollado con ❤️ para mejorar la gestión hospitalaria*

</div>