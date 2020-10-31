<template>
  <div class="home">
    <HomePage/>
  </div>
</template>

<script>
// @ is an alias to /src
import Covidgame from '@/components/Covidgame.vue'
import HomePage from '@/components/HomePage.vue'

export default {
  name: 'Home',
  components: {
    HomePage
  }
}
</script>

<style lang="scss">
  .home{
    height: auto;
  }
</style>
