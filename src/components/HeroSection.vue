<template>
  <section id="hero" class="min-h-screen flex items-center bg-gradient-to-br from-primary-50 via-white to-blue-50">
    <div class="container-custom">
      <div class="grid lg:grid-cols-2 gap-12 items-center">
        <!-- Content -->
        <div class="space-y-8" data-aos="fade-right">
          <div class="space-y-4">
            <p class="text-primary-600 font-medium text-lg">¡Hola! Soy</p>
            <h1 class="text-4xl md:text-5xl lg:text-6xl font-bold text-secondary-900">
              Gustavo Muñoz
            </h1>
            <p class="text-xl md:text-2xl text-gradient font-semibold">
              Desarrollador Full Stack
            </p>
            <p class="text-lg text-secondary-600 leading-relaxed max-w-2xl">
              Con <strong>5+ años de experiencia</strong> creando soluciones web innovadoras.
              Especializado en <strong>JavaScript, TypeScript, React, Vue.js, Angular y Node.js</strong>.
              He desarrollado plataformas SaaS, sistemas de gestión empresarial y aplicaciones de salud
              que impactan positivamente a miles de usuarios.
            </p>
          </div>

          <!-- Tech Stack -->
          <div class="flex flex-wrap gap-3">
            <span v-for="tech in mainTech" :key="tech"
              class="px-4 py-2 bg-primary-100 text-primary-700 rounded-full text-sm font-medium">
              {{ tech }}
            </span>
          </div>

          <!-- CTA Buttons -->
          <div class="flex flex-col sm:flex-row gap-4">
            <a href="#projects" class="btn-primary" @click="scrollToSection('#projects')">
              <CodeBracketIcon class="w-5 h-5" />
              Ver Proyectos
            </a>
            <a href="#contact" class="btn-secondary" @click="scrollToSection('#contact')">
              <ChatBubbleLeftRightIcon class="w-5 h-5" />
              Contáctame
            </a>
          </div>
        </div>

        <!-- Profile Image -->
        <div class="lg:order-2" data-aos="fade-left">
          <div class="relative">
            <!-- Background decoration -->
            <div
              class="absolute inset-0 bg-gradient-to-r from-primary-400 to-blue-500 rounded-full blur-2xl opacity-20 animate-pulse">
            </div>

            <!-- Profile image container -->
            <div class="relative bg-white p-4 rounded-full shadow-2xl">
              <img src="https://gatroxm.github.io/assets/img/FB_IMG_1618059924387.jpg"
                alt="Gustavo Muñoz - Desarrollador Full Stack"
                class="w-64 h-64 md:w-80 md:h-80 rounded-full object-cover border-4 border-white shadow-lg">
            </div>

            <!-- Floating elements -->
            <div
              class="absolute top-4 right-4 bg-primary-500 text-white p-3 rounded-full shadow-lg animate-bounce-slow">
              <ComputerDesktopIcon class="w-6 h-6" />
            </div>
            <div class="absolute bottom-4 left-4 bg-blue-500 text-white p-3 rounded-full shadow-lg animate-bounce-slow"
              style="animation-delay: 1s;">
              <CodeBracketIcon class="w-6 h-6" />
            </div>
          </div>
        </div>
      </div>

      <!-- Scroll indicator -->
      <div class="absolute bottom-8 left-1/2 transform -translate-x-1/2 animate-bounce">
        <ChevronDownIcon class="w-6 h-6 text-secondary-400" />
      </div>
    </div>
  </section>
</template>

<script setup>
import {
  CodeBracketIcon,
  ChatBubbleLeftRightIcon,
  ComputerDesktopIcon,
  ChevronDownIcon
} from '@heroicons/vue/24/outline'

const mainTech = ['JavaScript', 'TypeScript', 'React', 'Vue.js', 'Node.js', 'MongoDB', 'Angular']

const scrollToSection = (href) => {
  const element = document.querySelector(href)
  if (element) {
    element.scrollIntoView({ behavior: 'smooth' })
  }
}
</script>