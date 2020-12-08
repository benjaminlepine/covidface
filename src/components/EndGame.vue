<template>
  <div class="score-ctn">
    <h1 class="score-title">Votre Score :</h1>
    <h1 class="score-result" id="scoreText" ref="scoreText">{{score}}</h1>
    <div class="m-4">
      <div id="myProgress">
        <div ref="scoreBar" id="scoreBar" class="pt-2">0%</div>
      </div>
    </div>
    <div class="m-4">
    <router-link to="/Covidgame" class="btn covid-btn covid-btn--start w-100">Nouvelle partie</router-link>
    </div>
  </div>
</template>

<script>
  export default {
    name: 'EndGame',
    props: {
      score: Number
    },
    data: function () {
      return {}
    },
    methods : {

      move() {
        var i = 0;
        if (i === 0) {
          i = 1;
          var scoreBar = this.$refs.scoreBar;
          var scoreText = this.$refs.scoreText;
          var width = this.score;
          var id = setInterval(frame, 15);
          function frame() {
            if (width >= 80) {
              clearInterval(id);
              i = 0;
            } else {
              width++;
              scoreBar.style.width = width + "%";
              scoreBar.innerHTML = width  + "%";
              scoreText.innerHTML = width*190;
            }
          }
        }
      }
    },
    mounted() {
      this.score = 0;
      this.move()
    }
  }
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
  @import "../style";
  .score{
    &-ctn{
      min-height: 1000px;
    }
    &-title{
      padding-top: 50px;
      color: white;
      font-family: Coronaviral;
      font-size: 35px;
    }
    &-result{
      color: #ffd212;
      font-family: Coronaviral;
      font-size: 55px;
    }
  }

  #myProgress {
    width: 100%;
    background-color: #ddd;
  }

  #scoreBar {
    width: 10%;
    height: 50px;
    background-color: #4CAF50;
    text-align: center;
    line-height: 30px;
    color: white;
  }

  .bar-ctn{
    //margin: 0 20px;
  }


</style>
