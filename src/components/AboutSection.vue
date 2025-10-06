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
              Soy <strong>Gustavo Muñoz</strong>, desarrollador web Full Stack con amplia experiencia
              en tecnologías modernas como <strong>JavaScript, TypeScript, React, Vue.js, Angular, Node.js</strong>
              y <strong>MongoDB</strong>. Me especializo en crear soluciones web escalables y de alto rendimiento.
            </p>
            <p class="text-secondary-700 leading-relaxed">
              Mi trayectoria incluye el desarrollo de sistemas complejos como plataformas SaaS multi-tenant,
              sistemas de gestión hospitalaria, aplicaciones de control de salud y herramientas de estimación
              con inteligencia artificial. Me apasiona transformar ideas en productos digitales funcionales
              que generen valor real para los usuarios.
            </p>
            <p class="text-secondary-700 leading-relaxed">
              Cuento con certificaciones en <strong>desarrollo web completo</strong>, <strong>JavaScript
                moderno</strong>,
              <strong>React avanzado</strong> y <strong>Node.js</strong>. Mi enfoque se basa en código limpio,
              arquitecturas escalables y las mejores prácticas de desarrollo.
            </p>
          </div>

          <!-- Stats -->
          <div class="grid grid-cols-3 gap-6 pt-6">
            <div class="text-center">
              <div class="text-2xl font-bold text-primary-600">5+</div>
              <div class="text-sm text-secondary-600">Años de Experiencia</div>
            </div>
            <div class="text-center">
              <div class="text-2xl font-bold text-primary-600">25+</div>
              <div class="text-sm text-secondary-600">Proyectos Completados</div>
            </div>
            <div class="text-center">
              <div class="text-2xl font-bold text-primary-600">20+</div>
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
            <div v-for="item in timeline" :key="item.id" class="relative pl-8 pb-6 last:pb-0">
              <!-- Timeline line -->
              <div class="absolute left-0 top-2 w-4 h-4 bg-primary-500 rounded-full border-4 border-white shadow-lg">
              </div>
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
    period: '2024 - Presente',
    description: 'Desarrollo de ProjectHub, plataforma SaaS multi-tenant con estimaciones IA, Next.js y MongoDB Atlas.'
  },
  {
    id: 2,
    title: 'Desarrollador Full Stack',
    period: '2022 - 2024',
    description: 'Sistemas de gestión: App Veterinaria (Angular), App Control salud (React), Admin Hospitales (Vue.js).'
  },
  {
    id: 3,
    title: 'Especialización en JavaScript',
    period: '2021 - 2022',
    description: 'Certificaciones en JavaScript ES6+, React avanzado, Node.js y desarrollo web completo.'
  },
  {
    id: 4,
    title: 'Inicio Profesional',
    period: '2019 - 2021',
    description: 'Primeros proyectos profesionales con HTML5, CSS3, JavaScript, PHP y bases de datos relacionales.'
  }
]
</script>