<template>
  <div id="app">
    <img alt="Vue logo" src="./assets/logo.png">
    <HelloWorld msg="Welcome to Your Vue.js App"/>
  </div>
</template>

<script>
import HelloWorld from './components/HelloWorld.vue'

export default {
  name: 'app',
  components: {
    HelloWorld
  }
}
</script>

<style>
@import url('https://fonts.googleapis.com/css?family=Bungee&display=swap');
@import url('https://fonts.googleapis.com/css?family=Biryani&display=swap');

body {
  background-color: #4d0059;
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

footer {
  margin-top: 8rem;
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
