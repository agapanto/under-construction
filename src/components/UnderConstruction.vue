<template>
  <div class="hello">
    <h1>
      {{ title }}
    </h1>

    <p>
      {{ description }}
    </p>

    <div class="row">
      <div class="col-md-12">

        <div class="social-icons text-center my-4">

          <a class="px-4" :href="social_network.url" v-bind:key="social_network.id" v-for="social_network in social_networks">
            <font-awesome-icon :icon="[social_network.icon_style, social_network.icon]" />
          </a>

        </div>

      </div>
    </div>

    <div>

    </div>

  </div>
</template>

<script>
export default {
  name: 'UnderConstruction',
  props: {
    title: String,
    description: String
  },
  mounted: () => {
  },
  computed: {
    social_networks: () => {
      let enabled_social_networks = []

      if (process.env.VUE_APP_FACEBOOK_URL) {
        enabled_social_networks.push(
          {
            "id": "facebook",
            "name": "facebook",
            "icon": "facebook-f",
            "icon_style": "fab",
            "url": process.env.VUE_APP_FACEBOOK_URL
          }
        )
      }

      if (process.env.VUE_APP_INSTAGRAM_URL) {
        enabled_social_networks.push(
          {
            "id": "instagram",
            "name": "instagram",
            "icon": "instagram",
            "icon_style": "fab",
            "url": process.env.VUE_APP_INSTAGRAM_URL
          }
        )
      }

      if (process.env.VUE_APP_TWITTER_URL) {
        enabled_social_networks.push(
          {
            "id": "twitter",
            "name": "twitter",
            "icon": "twitter",
            "icon_style": "fab",
            "url": process.env.VUE_APP_TWITTER_URL
          }
        )
      }

      if (process.env.VUE_APP_GITHUB_URL) {
        enabled_social_networks.push(
          {
            "id": "github",
            "name": "github",
            "icon": "github",
            "icon_style": "fab",
            "url": process.env.VUE_APP_GITHUB_URL
          }
        )
      }

      return enabled_social_networks
    }
  },
  data: () => {
    return {
    }

  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.social-icons {
  font-size: 3rem;
}

</style>
