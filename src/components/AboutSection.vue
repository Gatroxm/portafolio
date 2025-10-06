<template>
  <section id="about" class="section-padding bg-white">
    <div class="container-custom">
      <div class="text-center mb-16" data-aos="fade-up">
        <h2 class="text-3xl md:text-4xl font-bold text-secondary-900 mb-4">
          Sobre Mí
        </h2>
        <p class="text-lg text-secondary-600 max-w-3xl mx-auto">
          Desarrollador apasionado por crear soluciones tecnológicas innovadoras
        </p>
      </div>
      
      <div class="grid lg:grid-cols-2 gap-12 items-center">
        <!-- Text Content -->
        <div class="space-y-6" data-aos="fade-right">
          <div class="space-y-4">
            <h3 class="text-2xl font-semibold text-secondary-900">
              ¿Quién soy?
            </h3>
            <p class="text-secondary-700 leading-relaxed">
              Soy un desarrollador web Full Stack especializado en las tecnologías 
              <strong>MERN</strong> (MongoDB, Express, React, Node.js) y 
              <strong>MEVN</strong> (MongoDB, Express, Vue.js, Node.js), con una sólida 
              experiencia en el desarrollo de aplicaciones web modernas y escalables.
            </p>
            <p class="text-secondary-700 leading-relaxed">
              Mi enfoque se centra en la creación de aplicaciones web eficientes, 
              manteniendo siempre las mejores prácticas de desarrollo y un código 
              limpio y mantenible. Me apasiona aprender nuevas tecnologías y 
              aplicarlas en proyectos que generen impacto real.
            </p>
          </div>
          
          <!-- Stats -->
          <div class="grid grid-cols-3 gap-6 pt-6">
            <div class="text-center">
              <div class="text-2xl font-bold text-primary-600">4+</div>
              <div class="text-sm text-secondary-600">Años de Experiencia</div>
            </div>
            <div class="text-center">
              <div class="text-2xl font-bold text-primary-600">20+</div>
              <div class="text-sm text-secondary-600">Proyectos Completados</div>
            </div>
            <div class="text-center">
              <div class="text-2xl font-bold text-primary-600">15+</div>
              <div class="text-sm text-secondary-600">Tecnologías</div>
            </div>
          </div>
        </div>
        
        <!-- Experience Timeline -->
        <div class="space-y-6" data-aos="fade-left">
          <h3 class="text-2xl font-semibold text-secondary-900 mb-8">
            Mi Trayectoria
          </h3>
          
          <div class="space-y-6">
            <div v-for="item in timeline" 
                 :key="item.id"
                 class="relative pl-8 pb-6 last:pb-0">
              <!-- Timeline line -->
              <div class="absolute left-0 top-2 w-4 h-4 bg-primary-500 rounded-full border-4 border-white shadow-lg"></div>
              <div class="absolute left-2 top-6 w-0.5 bg-secondary-200 h-full last:hidden"></div>
              
              <!-- Content -->
              <div class="bg-secondary-50 p-4 rounded-lg">
                <div class="flex justify-between items-start mb-2">
                  <h4 class="font-semibold text-secondary-900">{{ item.title }}</h4>
                  <span class="text-xs text-primary-600 bg-primary-100 px-2 py-1 rounded">
                    {{ item.period }}
                  </span>
                </div>
                <p class="text-sm text-secondary-600">{{ item.description }}</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup>
const timeline = [
  {
    id: 1,
    title: 'Desarrollador Full Stack Senior',
    period: '2023 - Presente',
    description: 'Lidero el desarrollo de aplicaciones SaaS multi-tenant con Vue.js, Node.js y MongoDB Atlas.'
  },
  {
    id: 2,
    title: 'Desarrollador Full Stack',
    period: '2021 - 2023',
    description: 'Desarrollo de sistemas de gestión empresarial con React, Angular y Node.js.'
  },
  {
    id: 3,
    title: 'Desarrollador Frontend',
    period: '2020 - 2021',
    description: 'Especialización en interfaces de usuario modernas con Vue.js y React.'
  },
  {
    id: 4,
    title: 'Inicio en Desarrollo Web',
    period: '2019 - 2020',
    description: 'Primeros pasos en desarrollo web con HTML, CSS, JavaScript y PHP.'
  }
]
</script>