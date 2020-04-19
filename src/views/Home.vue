<template>
  <div class="container">
    <VideoPlayer v-if="website_video_url" v-bind:video_url="website_video_url" />
    <UnderConstruction v-bind:title="website_title" v-bind:description="website_description" />
  </div>
</template>

<script>
import UnderConstruction from '../components/UnderConstruction.vue'
import VideoPlayer from '../components/VideoPlayer.vue'

export default {
  name: 'Home',
  components: {
    UnderConstruction,
    VideoPlayer
  },
  mounted: () => {
    document.title = process.env.VUE_APP_WEBSITE_TITLE || 'Sitio web en desarrollo'

    let favicon = document.getElementById("favicon")
    favicon.href = process.env.VUE_APP_WEBSITE_FAVICON_URL

    let body = document.getElementsByTagName("body")[0]
    body.style.backgroundColor=process.env.VUE_APP_WEBSITE_BACKGROUND_COLOR || "#4d0059"
    body.style.backgroundImage=process.env.VUE_APP_BACKGROUND_IMAGE_URL || "url('https://www.transparenttextures.com/patterns/shattered.png')"
    body.style.color=process.env.VUE_APP_WEBSITE_COLOR || "white"

    let title = document.getElementsByTagName("H1")[0]
    title.style.fontFamily = process.env.VUE_APP_WEBSITE_TITLE_FONTFAMILY || "Bungee, cursive"

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
      website_logo_url: process.env.VUE_APP_WEBSITE_LOGO_URL || require('../assets/software-development.png'),
      website_title: process.env.VUE_APP_WEBSITE_TITLE || 'Sitio web en desarrollo',
      website_description: process.env.VUE_APP_WEBSITE_DESCRIPTION || 'Estamos creando una experiencia personalizada para ti, mientras tanto puedes enterarte de este proyecto en las redes sociales a continuación.',
      website_video_url: process.env.VUE_APP_WEBSITE_VIDEO_URL,
      hide_website_footer: process.env.VUE_APP_HIDE_WEBSITE_FOOTER || false
    }
  }
}
</script>

<style>
</style>
