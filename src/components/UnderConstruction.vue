<template>
  <div class="hello">
    <h1>
      {{ title }}
    </h1>

    <p>
      {{ description }}
    </p>

  </div>
</template>

<script>
export default {
  name: 'UnderConstruction',
  props: {
    title: String,
    description: String
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
