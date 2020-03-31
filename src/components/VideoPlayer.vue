<template>
  <div class="video_player">

    <div class="row">
      <div class="col-md-12">

        <div class="embed-responsive embed-responsive-16by9 my-4">
          <iframe class="embed-responsive-item" v-bind:src="video_url" frameborder="0" allow="gyroscope; picture-in-picture" allowfullscreen></iframe>
        </div>

      </div>
    </div>

  </div>
</template>

<script>

export default {
  name: 'VideoPlayer',
  props: {
    video_url: String
  },
  mounted: () => {
  },
  computed: () => {
  },
  data: () => {
    return {
    }

  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
