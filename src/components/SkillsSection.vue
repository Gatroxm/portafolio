<template>
  <section id="skills" class="section-padding bg-gradient-to-br from-secondary-50 to-primary-50">
    <div class="container-custom">
      <div class="text-center mb-16" data-aos="fade-up">
        <h2 class="text-3xl md:text-4xl font-bold text-secondary-900 mb-4">
          Mis Habilidades
        </h2>
        <p class="text-lg text-secondary-600 max-w-3xl mx-auto">
          Tecnologías y herramientas con las que trabajo día a día
        </p>
      </div>
      
      <!-- Skills Categories -->
      <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-8 mb-12">
        <div v-for="category in skillCategories" 
             :key="category.id"
             class="card" 
             data-aos="fade-up" 
             :data-aos-delay="category.id * 100">
          <div class="text-center mb-6">
            <div class="w-16 h-16 bg-gradient-to-r from-primary-500 to-blue-500 rounded-full flex items-center justify-center mx-auto mb-4">
              <component :is="category.icon" class="w-8 h-8 text-white" />
            </div>
            <h3 class="text-xl font-semibold text-secondary-900">{{ category.name }}</h3>
          </div>
          
          <div class="grid grid-cols-2 gap-3">
            <div v-for="skill in category.skills" 
                 :key="skill.name"
                 class="skill-card text-center">
              <img :src="skill.icon" 
                   :alt="skill.name"
                   class="w-10 h-10 mx-auto mb-2">
              <p class="text-sm font-medium text-secondary-700">{{ skill.name }}</p>
            </div>
          </div>
        </div>
      </div>
      
      <!-- Technical Skills with Progress -->
      <div class="bg-white rounded-xl shadow-lg p-8" data-aos="fade-up">
        <h3 class="text-2xl font-semibold text-secondary-900 mb-8 text-center">
          Nivel de Competencia
        </h3>
        
        <div class="grid md:grid-cols-2 gap-8">
          <div v-for="skill in technicalSkills" 
               :key="skill.name"
               class="space-y-2">
            <div class="flex justify-between items-center">
              <span class="font-medium text-secondary-900">{{ skill.name }}</span>
              <span class="text-sm text-secondary-600">{{ skill.level }}%</span>
            </div>
            <div class="w-full bg-secondary-200 rounded-full h-3">
              <div class="bg-gradient-to-r from-primary-500 to-blue-500 h-3 rounded-full transition-all duration-1000 ease-out"
                   :style="{ width: skill.level + '%' }"></div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup>
import { 
  CodeBracketIcon, 
  ServerIcon, 
  CubeIcon 
} from '@heroicons/vue/24/outline'

const skillCategories = [
  {
    id: 1,
    name: 'Frontend',
    icon: CodeBracketIcon,
    skills: [
      { name: 'Vue.js', icon: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/vuejs/vuejs-original.svg' },
      { name: 'React', icon: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/react/react-original.svg' },
      { name: 'Angular', icon: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/angularjs/angularjs-original.svg' },
      { name: 'TypeScript', icon: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/typescript/typescript-original.svg' },
      { name: 'JavaScript', icon: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/javascript/javascript-original.svg' },
      { name: 'Tailwind CSS', icon: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/tailwindcss/tailwindcss-plain.svg' }
    ]
  },
  {
    id: 2,
    name: 'Backend',
    icon: ServerIcon,
    skills: [
      { name: 'Node.js', icon: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/nodejs/nodejs-original.svg' },
      { name: 'Express.js', icon: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/express/express-original.svg' },
      { name: 'NestJS', icon: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/nestjs/nestjs-plain.svg' },
      { name: 'Laravel', icon: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/laravel/laravel-plain.svg' },
      { name: 'PHP', icon: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/php/php-original.svg' },
      { name: 'Python', icon: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/python/python-original.svg' }
    ]
  },
  {
    id: 3,
    name: 'Base de Datos',
    icon: CubeIcon,
    skills: [
      { name: 'MongoDB', icon: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/mongodb/mongodb-original.svg' },
      { name: 'MySQL', icon: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/mysql/mysql-original.svg' },
      { name: 'PostgreSQL', icon: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/postgresql/postgresql-original.svg' },
      { name: 'Redis', icon: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/redis/redis-original.svg' },
      { name: 'Firebase', icon: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/firebase/firebase-plain.svg' },
      { name: 'Supabase', icon: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/supabase/supabase-original.svg' }
    ]
  }
]

const technicalSkills = [
  { name: 'Vue.js / Nuxt.js', level: 95 },
  { name: 'Node.js / Express.js', level: 90 },
  { name: 'MongoDB', level: 88 },
  { name: 'TypeScript', level: 85 },
  { name: 'React / Next.js', level: 82 },
  { name: 'Angular', level: 80 },
  { name: 'Docker', level: 75 },
  { name: 'AWS / Cloud', level: 70 }
]
</script>