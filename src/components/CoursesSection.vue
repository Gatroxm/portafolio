<template>
  <section id="courses" class="section-padding bg-gradient-to-br from-secondary-50 to-primary-50">
    <div class="container-custom">
      <div class="text-center mb-16" data-aos="fade-up">
        <h2 class="text-3xl md:text-4xl font-bold text-secondary-900 mb-4">
          Certificaciones y Cursos
        </h2>
        <p class="text-lg text-secondary-600 max-w-3xl mx-auto">
          Formación continua y certificaciones que respaldan mi expertise
        </p>
      </div>
      
      <!-- Courses Grid -->
      <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-6 mb-12">
        <div v-for="course in courses" 
             :key="course.id"
             class="card group hover:shadow-xl transition-all duration-300" 
             data-aos="fade-up" 
             :data-aos-delay="course.id * 50">
          
          <!-- Course Header -->
          <div class="flex items-start gap-4 mb-4">
            <div class="w-12 h-12 bg-gradient-to-r from-primary-500 to-blue-500 rounded-lg flex items-center justify-center flex-shrink-0">
              <AcademicCapIcon class="w-6 h-6 text-white" />
            </div>
            <div class="flex-1">
              <h3 class="font-semibold text-secondary-900 text-sm leading-tight mb-1">
                {{ course.title }}
              </h3>
              <p class="text-xs text-primary-600 font-medium">{{ course.platform }}</p>
            </div>
          </div>
          
          <!-- Course Description -->
          <p class="text-secondary-600 text-sm mb-4 line-clamp-3">
            {{ course.description }}
          </p>
          
          <!-- Skills Learned -->
          <div class="space-y-3 mb-4">
            <h4 class="text-xs font-semibold text-secondary-900 uppercase tracking-wider">
              Tecnologías aprendidas
            </h4>
            <div class="flex flex-wrap gap-2">
              <span v-for="skill in course.skills" 
                    :key="skill"
                    class="px-2 py-1 bg-primary-100 text-primary-700 text-xs rounded">
                {{ skill }}
              </span>
            </div>
          </div>
          
          <!-- Course Footer -->
          <div class="flex items-center justify-between pt-4 border-t border-secondary-100">
            <div class="flex items-center gap-2">
              <ClockIcon class="w-4 h-4 text-secondary-400" />
              <span class="text-xs text-secondary-600">{{ course.duration }}</span>
            </div>
            <a :href="course.certificateUrl" 
               target="_blank" 
               rel="noopener noreferrer"
               class="inline-flex items-center gap-1 text-xs font-medium text-primary-600 hover:text-primary-700 transition-colors duration-200">
              <DocumentCheckIcon class="w-4 h-4" />
              Ver Certificado
            </a>
          </div>
        </div>
      </div>
      
      <!-- Learning Philosophy -->
      <div class="bg-white rounded-xl shadow-lg p-8" data-aos="fade-up">
        <div class="text-center mb-8">
          <h3 class="text-2xl font-semibold text-secondary-900 mb-4">
            Filosofía de Aprendizaje Continuo
          </h3>
          <p class="text-secondary-600 max-w-2xl mx-auto">
            Creo firmemente en el aprendizaje continuo. La tecnología evoluciona constantemente, 
            y mantenerse actualizado es esencial para ofrecer las mejores soluciones.
          </p>
        </div>
        
        <div class="grid md:grid-cols-3 gap-8">
          <div class="text-center" v-for="stat in learningStats" :key="stat.label">
            <div class="text-3xl font-bold text-primary-600 mb-2">{{ stat.value }}</div>
            <div class="text-sm text-secondary-600">{{ stat.label }}</div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup>
import { 
  AcademicCapIcon, 
  ClockIcon, 
  DocumentCheckIcon 
} from '@heroicons/vue/24/outline'

const courses = [
  {
    id: 1,
    title: 'Legacy - Node: De cero a experto',
    platform: 'Udemy',
    description: 'Curso completo de Node.js desde los fundamentos hasta conceptos avanzados, con ejemplos prácticos para crear aplicaciones web y móviles.',
    duration: '40+ horas',
    skills: ['Node.js', 'Express.js', 'MongoDB', 'JWT', 'Socket.io'],
    certificateUrl: 'https://www.udemy.com/certificate/UC-YURSS5S0/'
  },
  {
    id: 2,
    title: 'React: De cero a experto (Hooks y MERN)',
    platform: 'Udemy',
    description: 'Curso integral de React incluyendo Hooks, Context API, Redux y desarrollo de aplicaciones MERN completas.',
    duration: '48+ horas',
    skills: ['React', 'Redux', 'Hooks', 'Context API', 'MERN Stack'],
    certificateUrl: 'https://www.udemy.com/certificate/UC-4d0545ba-bfc0-456e-8f51-42064be62193/'
  },
  {
    id: 3,
    title: 'Angular Avanzado: MEAN Stack',
    platform: 'Udemy',
    description: 'Desarrollo avanzado con Angular conectando a MongoDB, Express y Node.js para crear aplicaciones completas.',
    duration: '35+ horas',
    skills: ['Angular', 'TypeScript', 'MEAN Stack', 'RxJS', 'Angular Material'],
    certificateUrl: 'https://www.udemy.com/certificate/UC-85e91ac3-2a4e-4db0-b26c-25d0d98b99c5/'
  },
  {
    id: 4,
    title: 'Vue.js: De cero a experto',
    platform: 'Udemy',
    description: 'Dominio completo del framework Vue.js incluyendo Composition API, Vuex, Vue Router y mejores prácticas.',
    duration: '30+ horas',
    skills: ['Vue.js', 'Vuex', 'Vue Router', 'Composition API', 'Nuxt.js'],
    certificateUrl: '#'
  },
  {
    id: 5,
    title: 'SQL: Curso completo desde cero',
    platform: 'Udemy',
    description: 'Fundamentos y técnicas avanzadas de SQL Server, optimización de consultas y diseño de bases de datos.',
    duration: '25+ horas',
    skills: ['SQL Server', 'MySQL', 'PostgreSQL', 'Consultas Complejas', 'Optimización'],
    certificateUrl: 'https://www.udemy.com/certificate/UC-SA0OCXIM/'
  },
  {
    id: 6,
    title: 'Visual Studio Code: Productividad',
    platform: 'Udemy',
    description: 'Maximiza tu productividad con VS Code: extensiones, atajos, debugging y configuración avanzada.',
    duration: '8+ horas',
    skills: ['VS Code', 'Debugging', 'Extensions', 'Git Integration', 'Productivity'],
    certificateUrl: 'https://www.udemy.com/certificate/UC-5EE2YHPN/'
  }
]

const learningStats = [
  { value: '25+', label: 'Cursos Completados' },
  { value: '200+', label: 'Horas de Estudio' },
  { value: '15+', label: 'Certificaciones' }
]
</script>