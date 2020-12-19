<template>
  <div class="home-ctn pt-3">
    <img class="home-macron" src="../assets/macron.png" alt="">
    <h1 class="home-title mt-4">COVID-FACE</h1>
    <div class="home-subtitle">
        <h2>Trouvez quelle star se cache sous le masque.</h2>
        <p>Jouez au quiz du coronavirus et identifiez les stars masquées. Serez-vous capable d'obtenir le meilleur score</p>
    </div>
    <router-link to="/Covidgame" class="btn covid-btn covid-btn--start">Commencer</router-link><br>
    <!--<div class="categorie-ctn mb-5">
      <h1>CATEGORIES</h1>
      <div class="row">
        <div class="categorie-element--ghost col"></div>
        <div class="categorie-element col">
          <img class="categorie-icn" src="../assets/football.png" alt="football">
          <p class="categorie-subtitle">Football</p>
        </div>
        <div class="categorie-element col">
          <img class="categorie-icn" src="../assets/politic.png" alt="politic">
          <p class="categorie-subtitle">Politique</p>
        </div>
        <div class="categorie-element--ghost col"></div>
      </div>
      <div class="row">
        <div class="categorie-element--ghost col"></div>
        <div class="categorie-element col">
          <img class="categorie-icn" src="../assets/cinema.png" alt="cinema">
          <p class="categorie-subtitle">Cinéma</p>
        </div>
        <div class="categorie-element col">
          <img class="categorie-icn" src="../assets/music.png" alt="music">
          <p class="categorie-subtitle">Musique</p>
        </div>
        <div class="categorie-element--ghost col"></div>
      </div>
    </div>-->
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
  @import "../style";
  .home{
    &-ctn{
      padding-bottom: 20px;
      min-height: 900px;
    }
    &-macron{max-width: 120px}
    &-title{
      color: #acd3f7;
      font-size: 45px;
      font-family: Coronaviral, Calibri, sans-serif;
      margin-bottom: 0;
    }
    &-subtitle{
      margin: 10px 0 10px 0;
      color: #acd3f7 ;
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
        font-family: Coronaviral, "Times New Roman", Times, sans-serif;
      }
      border: 2px solid #5FF759;
      border-radius: 30px;
      padding: 15px;
      margin: 30px;
    }
    &-element{
      transition: filter 300ms, opacity 300ms, transform .8s ease-in-out;
      -webkit-transition: -webkit-transform .4s ease-in-out;
      padding: 0px;
      border: solid transparent 2px;
      &:hover {
        filter: brightness(1.25);
        cursor: pointer;
        -webkit-transform: rotate(10deg);
        transform: rotate(10deg);
        border-radius: 20%;
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

  @media screen and (max-width: 800px){
    .categorie-element--ghost{
      display: none;
    }
  }
</style>
