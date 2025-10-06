<template>
  <section id="contact" class="section-padding bg-white">
    <div class="container-custom">
      <div class="text-center mb-16" data-aos="fade-up">
        <h2 class="text-3xl md:text-4xl font-bold text-secondary-900 mb-4">
          Contacto
        </h2>
        <p class="text-lg text-secondary-600 max-w-3xl mx-auto">
          ¿Tienes un proyecto en mente? ¡Hablemos y creemos algo increíble juntos!
        </p>
      </div>

      <div class="grid lg:grid-cols-2 gap-12 items-start">
        <!-- Contact Info -->
        <div class="space-y-8" data-aos="fade-right">
          <div>
            <h3 class="text-2xl font-semibold text-secondary-900 mb-6">
              Información de Contacto
            </h3>
            <div class="space-y-4">
              <div v-for="contact in contactInfo" :key="contact.type" class="flex items-start gap-4 group">
                <div
                  class="w-12 h-12 bg-primary-100 group-hover:bg-primary-200 rounded-lg flex items-center justify-center flex-shrink-0 transition-colors duration-200">
                  <component :is="contact.icon" class="w-6 h-6 text-primary-600" />
                </div>
                <div>
                  <h4 class="font-medium text-secondary-900 mb-1">{{ contact.label }}</h4>
                  <a :href="contact.href"
                    class="text-secondary-600 hover:text-primary-600 transition-colors duration-200"
                    :target="contact.external ? '_blank' : '_self'"
                    :rel="contact.external ? 'noopener noreferrer' : ''">
                    {{ contact.value }}
                  </a>
                </div>
              </div>
            </div>
          </div>

          <!-- Social Links -->
          <div>
            <h3 class="text-xl font-semibold text-secondary-900 mb-6">
              Sígueme en Redes
            </h3>
            <div class="flex gap-4">
              <a v-for="social in socialLinks" :key="social.name" :href="social.href" target="_blank"
                rel="noopener noreferrer"
                class="w-12 h-12 bg-secondary-900 hover:bg-primary-600 text-white rounded-lg flex items-center justify-center transition-colors duration-200 group">
                <component :is="social.icon" class="w-6 h-6 group-hover:scale-110 transition-transform duration-200" />
                <span class="sr-only">{{ social.name }}</span>
              </a>
            </div>
          </div>

          <!-- Availability -->
          <div class="bg-gradient-to-r from-green-50 to-blue-50 p-6 rounded-xl">
            <div class="flex items-center gap-3 mb-2">
              <div class="w-3 h-3 bg-green-500 rounded-full animate-pulse"></div>
              <span class="font-semibold text-secondary-900">Disponible para proyectos</span>
            </div>
            <p class="text-secondary-600 text-sm">
              Actualmente aceptando nuevos proyectos y colaboraciones.
              Tiempo de respuesta promedio: 24 horas.
            </p>
          </div>
        </div>

        <!-- Contact Form -->
        <div class="card" data-aos="fade-left">
          <h3 class="text-xl font-semibold text-secondary-900 mb-6">
            Envíame un Mensaje
          </h3>

          <form @submit.prevent="sendMessage" class="space-y-6">
            <div class="grid md:grid-cols-2 gap-4">
              <div>
                <label for="name" class="block text-sm font-medium text-secondary-700 mb-2">
                  Nombre *
                </label>
                <input type="text" id="name" v-model="form.name" required
                  class="w-full px-4 py-3 border border-secondary-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-primary-500 transition-colors duration-200">
              </div>
              <div>
                <label for="email" class="block text-sm font-medium text-secondary-700 mb-2">
                  Email *
                </label>
                <input type="email" id="email" v-model="form.email" required
                  class="w-full px-4 py-3 border border-secondary-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-primary-500 transition-colors duration-200">
              </div>
            </div>

            <div>
              <label for="subject" class="block text-sm font-medium text-secondary-700 mb-2">
                Asunto *
              </label>
              <input type="text" id="subject" v-model="form.subject" required
                class="w-full px-4 py-3 border border-secondary-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-primary-500 transition-colors duration-200">
            </div>

            <div>
              <label for="message" class="block text-sm font-medium text-secondary-700 mb-2">
                Mensaje *
              </label>
              <textarea id="message" v-model="form.message" required rows="5"
                class="w-full px-4 py-3 border border-secondary-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-primary-500 transition-colors duration-200 resize-none"
                placeholder="Cuéntame sobre tu proyecto..."></textarea>
            </div>

            <button type="submit" :disabled="isSubmitting"
              class="w-full btn-primary justify-center disabled:opacity-50 disabled:cursor-not-allowed">
              <PaperAirplaneIcon class="w-5 h-5" />
              <span v-if="!isSubmitting">Enviar Mensaje</span>
              <span v-else>Enviando...</span>
            </button>
          </form>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup>
import { ref } from 'vue'
import {
  EnvelopeIcon,
  PhoneIcon,
  MapPinIcon,
  PaperAirplaneIcon
} from '@heroicons/vue/24/outline'

// GitHub, LinkedIn, WhatsApp icons would need to be added or use custom SVGs
const GitHubIcon = 'div' // Placeholder
const LinkedInIcon = 'div' // Placeholder  
const WhatsAppIcon = 'div' // Placeholder

const form = ref({
  name: '',
  email: '',
  subject: '',
  message: ''
})

const isSubmitting = ref(false)

const contactInfo = [
  {
    type: 'email',
    label: 'Email',
    value: 'tavoxpau@gmail.com',
    href: 'mailto:tavoxpau@gmail.com',
    icon: EnvelopeIcon,
    external: false
  },
  {
    type: 'phone',
    label: 'Teléfono',
    value: '+57 313 397 69 99',
    href: 'https://wa.me/+573133976999',
    icon: PhoneIcon,
    external: true
  },
  {
    type: 'location',
    label: 'Ubicación',
    value: 'Colombia',
    href: '#',
    icon: MapPinIcon,
    external: false
  }
]

const socialLinks = [
  {
    name: 'GitHub',
    href: 'https://github.com/Gatroxm',
    icon: GitHubIcon
  },
  {
    name: 'LinkedIn',
    href: 'https://www.linkedin.com/in/gustavo-adolfo-mu%C3%B1oz-reyes-a277b587/',
    icon: LinkedInIcon
  },
  {
    name: 'WhatsApp',
    href: 'https://wa.me/+573133976999',
    icon: WhatsAppIcon
  }
]

const sendMessage = async () => {
  isSubmitting.value = true

  // Simular envío del formulario
  setTimeout(() => {
    alert('¡Mensaje enviado! Te contactaré pronto.')
    form.value = { name: '', email: '', subject: '', message: '' }
    isSubmitting.value = false
  }, 2000)
}
</script>