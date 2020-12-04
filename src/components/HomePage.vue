<template>
  <div class="home-ctn pt-5">
    <img class="home-macron" src="../assets/macron.png" alt="">
    <h1 class="home-title mt-4">COVID-FACE</h1>
    <p class="home-subtitle">Devinez qui est sous le masque COVID-19</p>
    <router-link to="/Covidgame" class="btn home-btn home-btn--start">Commencer</router-link><br>
    <div class="categorie-ctn mb-5">
      <h1>CATEGORIES</h1>
      <div class="row">
        <div class="col"></div>
        <div class="categorie-element col">
          <img class="categorie-icn" src="../assets/football.png" alt="football">
          <p class="categorie-subtitle">Football</p>
        </div>
        <div class="categorie-element col">
          <img class="categorie-icn" src="../assets/politic.png" alt="politic">
          <p class="categorie-subtitle">Politique</p>
        </div>
        <div class="col"></div>
      </div>
      <div class="row">
        <div class="col"></div>
        <div class="categorie-element col">
          <img class="categorie-icn" src="../assets/cinema.png" alt="cinema">
          <p class="categorie-subtitle">Cinéma</p>
        </div>
        <div class="categorie-element col">
          <img class="categorie-icn" src="../assets/music.png" alt="music">
          <p class="categorie-subtitle">Musique</p>
        </div>
        <div class="col"></div>
      </div>
    </div>
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
      padding-bottom: 20px;
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

  .categorie{
    &-icn {
      max-width: 100px;

    }
    &-ctn{

      & h1{
        color: #5ff759;
        font-size: 35px;
        font-family: Coronaviral;
      }
      border: 2px solid #5FF759;
      border-radius: 30px;
      padding: 20px;
      margin: 30px;
    }
    &-element{
      transition: filter 300ms, opacity 300ms, transform .8s ease-in-out;
      -webkit-transition: -webkit-transform .4s ease-in-out;
      padding: 15px;
      border: solid transparent 2px;
      &:hover {
        filter: brightness(1.25);
        cursor: pointer;
        -webkit-transform: rotate(10deg);
        transform: rotate(10deg);
        border-radius: 50%;
        border-color: #536d8a;

      }
    }
    &-subtitle{
      color: #a2c2e3;
      margin-bottom: 0;
      font-size: 18px;
      font-family: Helvetica;
    }
  }
</style>
