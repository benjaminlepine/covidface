<template>
  <div class="home-ctn pt-5">
    <img class="home-macron" src="../assets/macron.png" alt="">
    <h1 class="home-title mt-4">COVID-FACE</h1>
    <p class="home-subtitle">Devinez qui est sous le masque COVID-19</p>
    <router-link to="/Covidgame" class="btn home-btn home-btn--start">Commencer</router-link><br>
    <button v-on:click="StartGame()" class="btn home-btn home-btn--cancel mt-2">Quitter</button>
  </div>
</template>

<script>
  export default {
    name: 'HomePage',
    props: {
      msg: String
    },
    el : 'main',
    data: function () {
      return {}
    },
    methods : {}
  }
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
  .home{
    &-ctn{
      min-height: 900px;
      background-image: linear-gradient(#34A2E3, #000327);
    }
    &-macron{}
    &-title{
      color: #acd3f7;
      font-size: 65px;
      font-family: Coronaviral;
      margin-bottom: 0;
    }
    &-subtitle{
      color: #acd3f7 ;
    }
    &-btn{
      padding: 14px;
      min-width: 330px;
      font-weight: bold;
      &:hover{opacity: 0.7}
      &--start{
        color: #00044B;
        background-color: #BADAFB;
      }
      &--cancel{
        border: solid 2px #BADAFB;
        color: #BADAFB;
        &:hover{color: #BADAFB;};
      }
    }
  }
</style>
