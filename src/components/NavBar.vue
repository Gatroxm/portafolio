<template>
  <nav class="fixed top-0 left-0 right-0 bg-white/95 backdrop-blur-md z-50 border-b border-secondary-200">
    <div class="container-custom">
      <div class="flex items-center justify-between h-16">
        <!-- Logo -->
        <div class="flex-shrink-0">
          <h1 class="text-xl font-bold text-gradient">Gabriel Troncoso</h1>
        </div>
        
        <!-- Desktop Navigation -->
        <div class="hidden md:block">
          <div class="ml-10 flex items-baseline space-x-4">
            <a v-for="item in navigation" 
               :key="item.name"
               :href="item.href"
               class="text-secondary-600 hover:text-primary-600 px-3 py-2 rounded-md text-sm font-medium transition-colors duration-200"
               @click="scrollToSection(item.href)">
              {{ item.name }}
            </a>
          </div>
        </div>
        
        <!-- Mobile menu button -->
        <div class="md:hidden">
          <button @click="mobileMenuOpen = !mobileMenuOpen"
                  class="inline-flex items-center justify-center p-2 rounded-md text-secondary-600 hover:text-primary-600 hover:bg-secondary-100 transition-colors duration-200">
            <Bars3Icon v-if="!mobileMenuOpen" class="block h-6 w-6" />
            <XMarkIcon v-else class="block h-6 w-6" />
          </button>
        </div>
      </div>
    </div>
    
    <!-- Mobile Navigation -->
    <div v-show="mobileMenuOpen" class="md:hidden bg-white border-t border-secondary-200">
      <div class="px-2 pt-2 pb-3 space-y-1 sm:px-3">
        <a v-for="item in navigation" 
           :key="item.name"
           :href="item.href"
           class="text-secondary-600 hover:text-primary-600 block px-3 py-2 rounded-md text-base font-medium transition-colors duration-200"
           @click="scrollToSection(item.href); mobileMenuOpen = false">
          {{ item.name }}
        </a>
      </div>
    </div>
  </nav>
</template>

<script setup>
import { ref } from 'vue'
import { Bars3Icon, XMarkIcon } from '@heroicons/vue/24/outline'

const mobileMenuOpen = ref(false)

const navigation = [
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