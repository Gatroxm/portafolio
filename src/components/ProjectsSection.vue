<template>
  <section id="projects" class="section-padding bg-white">
    <div class="container-custom">
      <div class="text-center mb-16" data-aos="fade-up">
        <h2 class="text-3xl md:text-4xl font-bold text-secondary-900 mb-4">
          Proyectos Destacados
        </h2>
        <p class="text-lg text-secondary-600 max-w-3xl mx-auto">
          Una selección de mis trabajos más recientes y significativos
        </p>
      </div>
      
      <div class="grid md:grid-cols-2 lg:grid-cols-2 gap-8">
        <div v-for="project in projects" 
             :key="project.id"
             class="card group hover:scale-105 transform transition-all duration-300" 
             data-aos="fade-up" 
             :data-aos-delay="project.id * 100">
          <!-- Project Image -->
          <div class="relative overflow-hidden rounded-lg mb-6">
            <img :src="project.image" 
                 :alt="project.title"
                 class="w-full h-48 object-cover group-hover:scale-110 transition-transform duration-300">
            <div class="absolute inset-0 bg-gradient-to-t from-black/50 to-transparent opacity-0 group-hover:opacity-100 transition-opacity duration-300"></div>
            
            <!-- Project Status -->
            <div class="absolute top-4 left-4">
              <span class="px-3 py-1 text-xs font-medium rounded-full"
                    :class="project.status === 'Completado' 
                      ? 'bg-green-100 text-green-800' 
                      : project.status === 'En Desarrollo' 
                        ? 'bg-yellow-100 text-yellow-800'
                        : 'bg-blue-100 text-blue-800'">
                {{ project.status }}
              </span>
            </div>
          </div>
          
          <!-- Project Content -->
          <div class="space-y-4">
            <div>
              <h3 class="text-xl font-semibold text-secondary-900 mb-2">
                {{ project.title }}
              </h3>
              <p class="text-secondary-600 text-sm mb-4">
                {{ project.description }}
              </p>
            </div>
            
            <!-- Tech Stack -->
            <div class="flex flex-wrap gap-2">
              <span v-for="tech in project.technologies" 
                    :key="tech"
                    class="px-2 py-1 bg-primary-100 text-primary-700 text-xs font-medium rounded">
                {{ tech }}
              </span>
            </div>
            
            <!-- Features -->
            <div class="space-y-2">
              <h4 class="font-medium text-secondary-900 text-sm">Características principales:</h4>
              <ul class="space-y-1">
                <li v-for="feature in project.features.slice(0, 3)" 
                    :key="feature"
                    class="text-xs text-secondary-600 flex items-center gap-2">
                  <CheckIcon class="w-3 h-3 text-green-500 flex-shrink-0" />
                  {{ feature }}
                </li>
              </ul>
            </div>
            
            <!-- Actions -->
            <div class="flex gap-3 pt-4">
              <a :href="project.github" 
                 target="_blank" 
                 rel="noopener noreferrer"
                 class="flex-1 bg-secondary-900 hover:bg-secondary-800 text-white text-center py-2 px-4 rounded-lg text-sm font-medium transition-colors duration-200 flex items-center justify-center gap-2">
                <CodeBracketIcon class="w-4 h-4" />
                Código
              </a>
              <a v-if="project.demo" 
                 :href="project.demo" 
                 target="_blank" 
                 rel="noopener noreferrer"
                 class="flex-1 bg-primary-600 hover:bg-primary-700 text-white text-center py-2 px-4 rounded-lg text-sm font-medium transition-colors duration-200 flex items-center justify-center gap-2">
                <EyeIcon class="w-4 h-4" />
                Demo
              </a>
            </div>
          </div>
        </div>
      </div>
      
      <!-- View More Projects -->
      <div class="text-center mt-12" data-aos="fade-up">
        <a href="https://github.com/Gatroxm" 
           target="_blank" 
           rel="noopener noreferrer"
           class="btn-secondary">
          <ArrowTopRightOnSquareIcon class="w-5 h-5" />
          Ver todos mis proyectos en GitHub
        </a>
      </div>
    </div>
  </section>
</template>

<script setup>
import { 
  CodeBracketIcon, 
  EyeIcon, 
  CheckIcon,
  ArrowTopRightOnSquareIcon 
} from '@heroicons/vue/24/outline'

const projects = [
  {
    id: 1,
    title: 'Project Hub',
    description: 'Plataforma SaaS Multi-Tenant para casas de desarrollo de software con estimaciones IA y gestión integral de proyectos.',
    image: '/api/placeholder/400/200',
    status: 'Activo',
    technologies: ['Next.js', 'Node.js', 'MongoDB Atlas', 'Docker'],
    features: [
      'Motor de estimaciones con Inteligencia Artificial',
      'Gestión multi-tenant para múltiples clientes',
      'Dashboard analítico avanzado',
      'Sistema de documentación colaborativa'
    ],
    github: 'https://github.com/Gatroxm/ProjectHub',
    demo: null
  },
  {
    id: 2,
    title: 'App Veterinaria',
    description: 'Sistema completo de gestión veterinaria con autenticación JWT, roles de usuario y gestión de mascotas.',
    image: '/api/placeholder/400/200',
    status: 'Completado',
    technologies: ['Angular', 'Node.js', 'MongoDB', 'TypeScript'],
    features: [
      'Gestión completa de mascotas y propietarios',
      'Sistema de citas y recordatorios',
      'Historial médico veterinario completo',
      'Control de vacunas y desparasitaciones'
    ],
    github: 'https://github.com/Gatroxm/AppVeterinaria',
    demo: null
  },
  {
    id: 3,
    title: 'App Control',
    description: 'Sistema avanzado de control y monitoreo de salud, especializado en seguimiento de diabetes.',
    image: '/api/placeholder/400/200',
    status: 'Completado',
    technologies: ['React', 'Node.js', 'MongoDB', 'Express'],
    features: [
      'Dashboard en tiempo real con métricas',
      'Sistema de alertas automáticas',
      'Análisis predictivos de salud',
      'Gestión de usuarios y permisos'
    ],
    github: 'https://github.com/Gatroxm/AppControl',
    demo: null
  },
  {
    id: 4,
    title: 'App Admin Hospitals',
    description: 'Sistema integral para la administración de hospitales con gestión de pacientes, citas y recursos.',
    image: '/api/placeholder/400/200',
    status: 'En Desarrollo',
    technologies: ['Vue.js', 'Node.js', 'MongoDB', 'Express'],
    features: [
      'Gestión completa de pacientes',
      'Sistema de citas médicas',
      'Control de inventario médico',
      'Dashboard administrativo'
    ],
    github: 'https://github.com/Gatroxm/AppAdminHospitals',
    demo: null
  }
]
</script>