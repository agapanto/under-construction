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
          <a class="px-4" href="#">
            <font-awesome-icon :icon="['fab', 'facebook-f']" />
          </a>
          <a class="px-4" href="#">
            <font-awesome-icon :icon="['fab', 'instagram']" />
          </a>
          <a class="px-4" href="#">
            <font-awesome-icon :icon="['fab', 'github']" />
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
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.social-icons {
  font-size: 3rem;
}

</style>
