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
    document.title = process.env.VUE_APP_WEBSITE_TITLE || 'Sitio web en desarrollo'

    let favicon = document.getElementById("favicon")
    favicon.href = process.env.VUE_APP_WEBSITE_FAVICON_URL

    let body = document.getElementsByTagName("body")[0]
    body.style.backgroundColor=process.env.VUE_APP_WEBSITE_BACKGROUND_COLOR || "#4d0059"
    body.style.backgroundImage=process.env.VUE_APP_BACKGROUND_IMAGE_URL || "url('https://www.transparenttextures.com/patterns/shattered.png')"
    body.style.color=process.env.VUE_APP_WEBSITE_COLOR || "white"

    let links = document.getElementsByTagName("a")

    for (var index in links) {
      let link = links[index]
      if (links.hasOwnProperty(index)) {
        link.style.color=process.env.VUE_APP_WEBSITE_COLOR || "white"
      }
    }

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

body{
}

#app {
  font-family: 'Biryani', sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  margin-top: 60px;
}

a {
  text-decoration: none;
}

a:hover {
  text-decoration: underline;
}

</style>
