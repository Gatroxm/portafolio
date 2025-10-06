// Configuración de proyectos del ecosistema Gabriel Troncoso
export const projects = [
    {
        id: 'portfolio',
        name: 'Portfolio Principal',
        url: 'http://localhost:5173',
        type: 'Vue.js',
        description: 'Portfolio personal con Vue.js 3 + Tailwind CSS',
        status: 'Activo',
        technologies: ['Vue.js 3', 'Tailwind CSS', 'Vite', 'AOS'],
        features: [
            'Diseño responsive moderno',
            'Animaciones suaves',
            'Navegación integrada',
            'Hot reload development'
        ]
    },
    {
        id: 'projethub',
        name: 'ProjetHub',
        url: 'http://localhost:3000',
        type: 'Next.js',
        description: 'Plataforma SaaS Multi-Tenant con estimaciones IA',
        status: 'Activo',
        technologies: ['Next.js', 'Node.js', 'MongoDB Atlas', 'Docker'],
        features: [
            'Motor de estimaciones con IA',
            'Gestión multi-tenant',
            'Dashboard analítico avanzado',
            'Documentación colaborativa'
        ]
    },
    {
        id: 'veterinaria',
        name: 'App Veterinaria',
        url: 'http://localhost:4000',
        type: 'Angular',
        description: 'Sistema completo de gestión veterinaria',
        status: 'Completado',
        technologies: ['Angular', 'Node.js', 'MongoDB', 'TypeScript'],
        features: [
            'Gestión de mascotas y propietarios',
            'Sistema de citas y recordatorios',
            'Historial médico completo',
            'Control de vacunas'
        ]
    },
    {
        id: 'control',
        name: 'App Control',
        url: 'http://localhost:3001',
        type: 'React',
        description: 'Sistema de control y monitoreo de salud',
        status: 'Completado',
        technologies: ['React', 'Node.js', 'MongoDB', 'Express'],
        features: [
            'Dashboard en tiempo real',
            'Sistema de alertas automáticas',
            'Análisis predictivos',
            'Gestión de usuarios'
        ]
    },
    {
        id: 'hospitals',
        name: 'App Admin Hospitals',
        url: 'http://localhost:3002',
        type: 'Vue.js',
        description: 'Sistema integral para administración hospitalaria',
        status: 'En Desarrollo',
        technologies: ['Vue.js', 'Node.js', 'MongoDB', 'Express'],
        features: [
            'Gestión de pacientes',
            'Sistema de citas médicas',
            'Control de inventario',
            'Dashboard administrativo'
        ]
    }
];

export const getProjectUrl = (projectId) => {
    const project = projects.find(p => p.id === projectId);
    return project ? project.url : '#';
};

export const getRunningProjects = () => {
    return projects.filter(p => p.status === 'Activo' || p.status === 'Completado');
};

export const getProjectsByTechnology = (tech) => {
    return projects.filter(p => p.technologies.includes(tech));
};