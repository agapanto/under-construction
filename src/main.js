import Vue from 'vue'
import App from './App.vue'
import { library } from '@fortawesome/fontawesome-svg-core'
import { faFacebookF } from '@fortawesome/free-brands-svg-icons'
import { faInstagram } from '@fortawesome/free-brands-svg-icons'
import { faGithub } from '@fortawesome/free-brands-svg-icons'
import { faTwitter } from '@fortawesome/free-brands-svg-icons'
import { faEnvelope } from '@fortawesome/free-solid-svg-icons'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'

library.add(faFacebookF)
library.add(faInstagram)
library.add(faTwitter)
library.add(faGithub)
library.add(faEnvelope)

Vue.component('font-awesome-icon', FontAwesomeIcon)

Vue.config.productionTip = false

new Vue({
  render: h => h(App),
}).$mount('#app')
