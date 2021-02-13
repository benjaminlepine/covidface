<template>
  <div class="score-ctn">
    <h1 class="score-title">Votre Score :</h1>
    <h1 class="score-result" id="scoreText" ref="scoreText">
      {{ store.state.score }}
    </h1>
    <div class="m-4">
      <div id="myProgress">
        <div ref="scoreBar" id="scoreBar" class="pt-2">0%</div>
        <!--        <progress ref="scoreBar" id="scoreBar" class="pt-2">0%</progress>-->
      </div>
    </div>
    <img class="home-macron mb-4" src="../assets/macron.png" />
    <div class="score-links m-3">
      <router-link to="/Covidgame" class="btn covid-btn covid-btn--start w-100"
        >Nouvelle partie</router-link
      >
      <router-link to="/" class="btn covid-btn covid-btn--cancel w-100 mt-3"
        >Menu</router-link
      >
    </div>
  </div>
</template>

<script>
import store from "../store/index.js";

export default {
  name: "EndGame",
  data: function () {
    return {
      store: store,
    };
  },
  methods: {
    move() {
      var i = 0;
      if (i === 0) {
        i = 1;
        var scoreBar = this.$refs.scoreBar;
        var width = 0;
        var id = setInterval(frame, 15);
        function frame() {
          if (width >= store.state.percent) {
            clearInterval(id);
            i = 0;
          } else {
            width++;
            scoreBar.style.width = width + "%";
            scoreBar.innerHTML = width + "%";
          }
        }
      }
    },
    calculate() {
      var i = 0;
      if (i === 0) {
        i = 1;
        var scoreText = this.$refs.scoreText;
        var width = 0;
        var id = setInterval(frame, 3);
        function frame() {
          if (width >= store.state.score) {
            clearInterval(id);
            i = 0;
          } else {
            width++;
            scoreText.innerHTML = width;
          }
        }
      }
    },
  },
  mounted() {
    this.move();
    this.calculate();
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
@import "../style";
.score {
  &-ctn {
    max-height: 100vh;
    padding: 1em;
    font-size: 16px;

    @media screen and (max-height: 620px) {
      font-size: 12px;
    }
  }

  &-title {
    color: white;
    font-family: Coronaviral;
    font-size: 2.5em;
  }

  &-result {
    color: #ffd212;
    font-family: Coronaviral;
    font-size: 4em;
  }

  &-links {
    display: flex;
    flex-direction: column;
    align-items: center;
  }
}

.home-macron {
  max-width: 100%;

  @media screen and (max-height: 680px) {
    width: 40%;
  }
}

#myProgress {
  width: 100%;
  background-color: #ddd;
}

#scoreBar {
  width: 10%;
  height: 50px;
  background-color: #4caf50;
  text-align: center;
  line-height: 30px;
  color: white;
}
</style>
