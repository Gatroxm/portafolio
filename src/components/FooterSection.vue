<template>
  <footer class="bg-secondary-900 text-white section-padding">
    <div class="container-custom">
      <div class="grid md:grid-cols-2 lg:grid-cols-4 gap-8 mb-8">
        <!-- Brand -->
        <div class="lg:col-span-2">
          <h3 class="text-xl font-bold mb-4">Gustavo Muñoz</h3>
          <p class="text-secondary-300 mb-4 max-w-md">
            Desarrollador Full Stack especializado en crear aplicaciones web
            modernas y escalables que generen impacto real.
          </p>
          <div class="flex gap-4">
            <a v-for="social in socialLinks" :key="social.name" :href="social.href" target="_blank"
              rel="noopener noreferrer"
              class="w-10 h-10 bg-secondary-800 hover:bg-primary-600 rounded-lg flex items-center justify-center transition-colors duration-200">
              <component :is="social.icon" class="w-5 h-5" />
            </a>
          </div>
        </div>

        <!-- Quick Links -->
        <div>
          <h4 class="font-semibold mb-4">Enlaces Rápidos</h4>
          <ul class="space-y-2">
            <li v-for="link in quickLinks" :key="link.name">
              <a :href="link.href" class="text-secondary-300 hover:text-white transition-colors duration-200"
                @click="scrollToSection(link.href)">
                {{ link.name }}
              </a>
            </li>
          </ul>
        </div>

        <!-- Contact Info -->
        <div>
          <h4 class="font-semibold mb-4">Contacto</h4>
          <ul class="space-y-2 text-secondary-300">
            <li class="flex items-center gap-2">
              <EnvelopeIcon class="w-4 h-4" />
              <a href="mailto:tavoxpau@gmail.com" class="hover:text-white transition-colors duration-200">
                tavoxpau@gmail.com
              </a>
            </li>
            <li class="flex items-center gap-2">
              <PhoneIcon class="w-4 h-4" />
              <a href="https://wa.me/+573133976999" target="_blank" rel="noopener noreferrer"
                class="hover:text-white transition-colors duration-200">
                +57 313 397 69 99
              </a>
            </li>
            <li class="flex items-center gap-2">
              <MapPinIcon class="w-4 h-4" />
              <span>Colombia</span>
            </li>
          </ul>
        </div>
      </div>

      <!-- Bottom Bar -->
      <div class="border-t border-secondary-800 pt-8 flex flex-col md:flex-row justify-between items-center gap-4">
        <p class="text-secondary-300 text-sm">
          © {{ currentYear }} Gustavo Muñoz. Todos los derechos reservados.
        </p>
        <div class="flex items-center gap-4 text-sm text-secondary-300">
          <span>Hecho con ❤️ en Vue.js</span>
          <a href="https://github.com/Gatroxm/portfolio" target="_blank" rel="noopener noreferrer"
            class="hover:text-white transition-colors duration-200 flex items-center gap-1">
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
  CodeBracketIcon
} from '@heroicons/vue/24/outline'

// Placeholder icons (would need proper icons in real implementation)
const GitHubIcon = 'div'
const LinkedInIcon = 'div'
const WhatsAppIcon = 'div'

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
    name: 'WhatsApp',
    href: 'https://wa.me/+573133976999',
    icon: WhatsAppIcon
  }
]

const quickLinks = [
  { name: 'Inicio', href: '#hero' },
  { name: 'Sobre mí', href: '#about' },
  { name: 'Habilidades', href: '#skills' },
  { name: 'Proyectos', href: '#projects' },
  { name: 'Cursos', href: '#courses' },
  { name: 'Contacto', href: '#contact' }
]

const scrollToSection = (href) => {
  const element = document.querySelector(href)
  if (element) {
    element.scrollIntoView({ behavior: 'smooth' })
  }
}
</script>