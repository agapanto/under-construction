<template>
  <div id="app" class="container">

    <div class="row py-4 mb-4">
      <div class="col-8 offset-2 col-md-6 offset-md-3">
        <img alt="Vue logo" v-bind:src="website_logo_url" class="img-fluid">
      </div>
    </div>

    <UnderConstruction v-bind:title="website_title" v-bind:description="website_description" />

    <footer class="mt-4" v-if="hide_website_footer==false">
      Desarrollo web por<br>
      <a href="https://agapanto.cl">agapanto comunicación digital</a>
    </footer>

  </div>
</template>

<script>
import 'bootstrap'
import 'bootstrap/dist/css/bootstrap.min.css'
import UnderConstruction from './components/UnderConstruction.vue'

export default {
  name: 'app',
  components: {
    UnderConstruction
  },
  mounted: () => {
    let body = document.getElementsByTagName("body")[0]
    body.style.backgroundColor=process.env.VUE_APP_WEBSITE_BACKGROUND_COLOR || "#4d0059"
  },
  data: () => {
    return {
      website_logo_url: process.env.VUE_APP_WEBSITE_LOGO_URL || require('./assets/software-development.png'),
      website_title: process.env.VUE_APP_WEBSITE_TITLE || 'Sitio web en desarrollo',
      website_description: process.env.VUE_APP_WEBSITE_DESCRIPTION || 'Estamos creando una experiencia personalizada para ti, mientras tanto puedes enterarte de este proyecto en las redes sociales a continuación.',
      hide_website_footer: process.env.VUE_APP_HIDE_WEBSITE_FOOTER || false
    }
  }
}
</script>

<style>
@import url('https://fonts.googleapis.com/css?family=Bungee&display=swap');
@import url('https://fonts.googleapis.com/css?family=Biryani&display=swap');

body {
  background-image: url("https://www.transparenttextures.com/patterns/shattered.png");
  /* This is mostly intended for prototyping; please download the pattern and re-host for production environments. Thank you! */
}

#app {
  font-family: 'Biryani', sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: white;
  margin-top: 60px;
}

h1, h2, h3, h4, h5, h6 {
  font-family: 'Bungee', cursive;
  color: white;
}

a {
  color: white;
  text-decoration: none;
}

a:hover {
  color: white;
  text-decoration: underline;
}

</style>
