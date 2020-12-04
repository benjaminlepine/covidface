<template>
  <div class="score-ctn">
    <h1 class="score-title">Votre Score :</h1>
    <h1 class="score-result">{{score}}</h1>

    <div id="myProgress">
      <div ref="myButton" id="myButton">10%</div>
    </div>
    <button @click="move">Click Me</button>

    <router-link to="/Covidgame" class="btn covid-btn covid-btn--start">Nouvelle partie</router-link>
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
          var elem = this.$refs.myButton;
          var width = 10;
          var id = setInterval(frame, 10);
          function frame() {
            if (width >= 80) {
              clearInterval(id);
              i = 0;
            } else {
              width++;
              elem.style.width = width + "%";
              elem.innerHTML = width  + "%";
            }
          }
        }
      }
    },
    mounted() {
      this.score = 1580;
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

  #myButton {
    width: 10%;
    height: 30px;
    background-color: #4CAF50;
    text-align: center;
    line-height: 30px;
    color: white;
  }


</style>
