<template>
  <div class="home">
    <HelloWorld msg="COVID-FACE"/>
  </div>
</template>

<script>
// @ is an alias to /src
import HelloWorld from '@/components/Covidgame.vue'

export default {
  name: 'Home',
  components: {
    HelloWorld
  }
}
</script>
