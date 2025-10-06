<template>
  <footer class="bg-secondary-900 text-white">
    <div class="container-custom section-padding">
      <div class="grid md:grid-cols-3 gap-8 mb-8">
        <!-- Brand -->
        <div class="space-y-4">
          <h3 class="text-2xl font-bold text-gradient-white">Gabriel Troncoso</h3>
          <p class="text-secondary-300 leading-relaxed">
            Desarrollador Full Stack especializado en crear soluciones web modernas 
            y escalables con Vue.js, Node.js y MongoDB.
          </p>
          <div class="flex gap-4">
            <a v-for="social in socialLinks" 
               :key="social.name"
               :href="social.href"
               target="_blank" 
               rel="noopener noreferrer"
               class="w-10 h-10 bg-secondary-800 hover:bg-primary-600 rounded-lg flex items-center justify-center transition-colors duration-200 group">
              <component :is="social.icon" class="w-5 h-5 group-hover:scale-110 transition-transform duration-200" />
            </a>
          </div>
        </div>
        
        <!-- Quick Links -->
        <div class="space-y-4">
          <h4 class="text-lg font-semibold">Enlaces Rápidos</h4>
          <ul class="space-y-2">
            <li v-for="link in quickLinks" :key="link.name">
              <a :href="link.href" 
                 class="text-secondary-300 hover:text-primary-400 transition-colors duration-200 flex items-center gap-2"
                 @click="scrollToSection(link.href)">
                <ChevronRightIcon class="w-4 h-4" />
                {{ link.name }}
              </a>
            </li>
          </ul>
        </div>
        
        <!-- Contact Info -->
        <div class="space-y-4">
          <h4 class="text-lg font-semibold">Información de Contacto</h4>
          <div class="space-y-3">
            <div class="flex items-center gap-3">
              <EnvelopeIcon class="w-5 h-5 text-primary-400" />
              <a href="mailto:gabriel.troncoso.dev@gmail.com" 
                 class="text-secondary-300 hover:text-primary-400 transition-colors duration-200">
                gabriel.troncoso.dev@gmail.com
              </a>
            </div>
            <div class="flex items-center gap-3">
              <PhoneIcon class="w-5 h-5 text-primary-400" />
              <a href="https://wa.me/+573133976999" 
                 target="_blank" 
                 rel="noopener noreferrer"
                 class="text-secondary-300 hover:text-primary-400 transition-colors duration-200">
                +57 313 397 69 99
              </a>
            </div>
            <div class="flex items-center gap-3">
              <MapPinIcon class="w-5 h-5 text-primary-400" />
              <span class="text-secondary-300">Colombia</span>
            </div>
          </div>
        </div>
      </div>
      
      <!-- Tech Stack -->
      <div class="border-t border-secondary-800 pt-8 mb-8">
        <h4 class="text-lg font-semibold mb-4 text-center">Tecnologías Principales</h4>
        <div class="flex flex-wrap justify-center gap-4">
          <div v-for="tech in mainTechnologies" 
               :key="tech.name"
               class="flex items-center gap-2 bg-secondary-800 px-3 py-2 rounded-lg hover:bg-secondary-700 transition-colors duration-200">
            <img :src="tech.icon" :alt="tech.name" class="w-5 h-5">
            <span class="text-sm text-secondary-200">{{ tech.name }}</span>
          </div>
        </div>
      </div>
      
      <!-- Bottom Bar -->
      <div class="border-t border-secondary-800 pt-6 flex flex-col md:flex-row justify-between items-center gap-4">
        <div class="text-secondary-400 text-sm">
          © {{ currentYear }} Gabriel Troncoso. Todos los derechos reservados.
        </div>
        
        <div class="flex items-center gap-6 text-sm text-secondary-400">
          <span class="flex items-center gap-2">
            <HeartIcon class="w-4 h-4 text-red-400" />
            Hecho con Vue.js
          </span>
          <a href="https://github.com/Gatroxm/portafolio" 
             target="_blank" 
             rel="noopener noreferrer"
             class="hover:text-primary-400 transition-colors duration-200 flex items-center gap-1">
            <CodeBracketIcon class="w-4 h-4" />
            Ver código fuente
          </a>
        </div>
      </div>
    </div>
  </footer>
</template>

<script setup>
import { computed } from 'vue'
import { 
  EnvelopeIcon, 
  PhoneIcon, 
  MapPinIcon,
  ChevronRightIcon,
  HeartIcon,
  CodeBracketIcon
} from '@heroicons/vue/24/outline'

// Placeholder icons for social media - these would need proper implementation
const GitHubIcon = 'div'
const LinkedInIcon = 'div'
const TwitterIcon = 'div'

const currentYear = computed(() => new Date().getFullYear())

const socialLinks = [
  {
    name: 'GitHub',
    href: 'https://github.com/Gatroxm',
    icon: GitHubIcon
  },
  {
    name: 'LinkedIn',
    href: 'https://www.linkedin.com/in/gabriel-troncoso',
    icon: LinkedInIcon
  },
  {
    name: 'Twitter',
    href: 'https://twitter.com/gatroxm',
    icon: TwitterIcon
  }
]

const quickLinks = [
  { name: 'Sobre mí', href: '#about' },
  { name: 'Habilidades', href: '#skills' },
  { name: 'Proyectos', href: '#projects' },
  { name: 'Cursos', href: '#courses' },
  { name: 'Contacto', href: '#contact' }
]

const mainTechnologies = [
  {
    name: 'Vue.js',
    icon: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/vuejs/vuejs-original.svg'
  },
  {
    name: 'Node.js',
    icon: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/nodejs/nodejs-original.svg'
  },
  {
    name: 'MongoDB',
    icon: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/mongodb/mongodb-original.svg'
  },
  {
    name: 'TypeScript',
    icon: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/typescript/typescript-original.svg'
  },
  {
    name: 'Tailwind',
    icon: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/tailwindcss/tailwindcss-plain.svg'
  }
]

const scrollToSection = (href) => {
  const element = document.querySelector(href)
  if (element) {
    element.scrollIntoView({ behavior: 'smooth' })
  }
}
</script>

<style scoped>
.text-gradient-white {
  background: linear-gradient(135deg, #ffffff 0%, #e2e8f0 100%);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
}
</style>