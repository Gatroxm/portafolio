import { createApp } from 'vue'
import router from './router'
import App from './App.vue'
import './style.css'
import AOS from 'aos'
import 'aos/dist/aos.css'

const app = createApp(App)

app.use(router)

app.mount('#app')

// Initialize AOS
AOS.init({
  duration: 800,
  easing: 'ease-out-cubic',
  once: true,
  offset: 100
})