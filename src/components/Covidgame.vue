<template>
  <div>
    <div class="covidgame">
      <div class="score-bar">
        <p class="score mb-0">SCORE: {{ score }}</p>
        <Hourglass />
      </div>
      <div class="starface">
        <img
          class="starface--mask"
          v-if="displayMask"
          src="../assets/mask.png"
          alt="mask"
        />
        <canvas
          class="starface--morphing starface--morphing--hide"
          ref="canvas1"
          height="702"
          width="425"
        />
        <canvas
          class="starface--morphing starface--morphing--hide"
          ref="canvas2"
          height="702"
          width="425"
        />
        <canvas
          class="starface--morphing starface--morphing--hide"
          ref="canvas3"
          height="702"
          width="425"
        />
        <canvas
          class="starface--morphing"
          ref="result"
          height="702"
          width="425"
        />
        <img
          class="starface--img"
          :src="imageData.url[0]"
          alt="masked star face"
        />
      </div>
      <div class="answers">
        <button
          v-on:click="sendAnswer(choice)"
          class="answers--choice"
          v-for="(choice, index) in imageData.choices"
          :class="{
            'answers--choice--correct': correctAnswer === choice,
            'answers--choice--wrong':
              userAnswer === choice && userAnswer !== correctAnswer,
          }"
          :key="index"
          :disabled="disableClick"
        >
          {{ choice }}
        </button>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import store from "../store/index.js";
import {
  originalImagePoints,
  modifiedImagePoints,
  IMAGE_WIDTH,
  IMAGE_HEIGHT,
} from "../utils/constants";
import Hourglass from "../animations/Hourglass";

export default {
  components: { Hourglass },
  name: "Covidgame",
  data: function () {
    return {
      displayMask: true,
      imageData: { choices: [], url: [] },
      score: 0,
      pointDefiners: {},
      userAnswer: null,
      correctAnswer: null,
      disableClick: false,
    };
  },
  created() {
    this.loadNewData();
  },
  methods: {
    displayAnimation(result, gameId) {
      this.displayMask = false;
      this.draw(result);
      setTimeout(() => {
        this.loadNewData(gameId);
      }, 800);
    },
    clearCanvas() {
      const canvasList = ["canvas1", "canvas2", "canvas3", "result"];
      canvasList.forEach((target) => {
        const canvas = this.$refs[target];
        if (canvas) {
          canvas.getContext("2d").clearRect(0, 0, canvas.width, canvas.height);
        }
      });
    },
    loadImage(url) {
      return new Promise((resolve) => {
        let img = new Image();
        img.addEventListener("load", () => {
          resolve(img);
        });
        img.src = url;
        img.crossOrigin = "Anonymous";
      });
    },
    onImageLoad(imgSrc, target, defaultPoints) {
      this.loadImage(imgSrc).then((img) => {
        const canvas = this.$refs[target];
        const context = canvas.getContext("2d");
        context.drawImage(img, 0, 0);
        let oriPoints = [];
        for (let i = 0; i < defaultPoints.length; i++) {
          oriPoints.push(
            new ImgWarper.Point(
              originalImagePoints[i].x,
              originalImagePoints[i].y
            )
          );
        }
        this.pointDefiners[target] = {
          imgData: context.getImageData(0, 0, IMAGE_WIDTH, IMAGE_HEIGHT),
          oriPoints,
        };
      });
    },
    generateFrames(target) {
      const animator = new ImgWarper.Animator(
        this.pointDefiners["canvas1"],
        this.pointDefiners[target]
      );
      animator.generate(7);
      let frames = animator.frames;
      frames.push(
        this.$refs[target]
          .getContext("2d")
          .getImageData(0, 0, IMAGE_WIDTH, IMAGE_HEIGHT)
      );
      return frames;
    },
    draw(success) {
      function myLoop(frames, context, i) {
        setTimeout(() => {
          context.putImageData(frames[i], 0, 0);
          if (i < frames.length - 1) {
            myLoop(frames, context, i + 1);
          }
        }, 40);
      }
      const frames = this.generateFrames(success ? "canvas2" : "canvas3");
      const context = this.$refs.result.getContext("2d");
      myLoop(frames, context, 0);
    },
    async loadNewData(gameId) {
      var res;
      this.clearCanvas();
      this.userAnswer = null;
      this.correctAnswer = null;

      if (gameId != undefined) {
        var params = {
          params: {
            gameId: gameId,
          },
        };
      } else {
        var params = {};
      }
      await axios
        .get("http://service.covid-face.com/face", params)
        .then((response) => {
          res = response.data[0];
          this.imageData = res;
          if (res.game_end) {
            this.$router.push("/EndGame");
          } else {
            this.onImageLoad(
              this.imageData.url[0],
              "canvas1",
              originalImagePoints
            );
            this.onImageLoad(
              this.imageData.url[1],
              "canvas2",
              modifiedImagePoints
            );
            this.onImageLoad(
              this.imageData.url[2],
              "canvas3",
              modifiedImagePoints
            );
            this.displayMask = true;
            this.disableClick = false;
          }
        })
        .catch((error) => {
          console.error(error);
        });
    },
    async sendAnswer(answer) {
      this.disableClick = true;
      var res;
      var formdata = new FormData();
      formdata.append("hash", this.imageData.hash);
      formdata.append("response", answer);
      formdata.append("gameId", this.imageData.gameId);

      await axios
        .post("http://service.covid-face.com/face", formdata)
        .then((response) => {
          res = response.data;
        })
        .catch((error) => {
          console.error(error);
        });
      this.score = res.score;
      this.correctAnswer = res.response;
      this.userAnswer = answer;

      // Store score in global store
      store.state.score = this.score;
      this.displayAnimation(res.result, res.gameId);
    },
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
$base-color: #2c3e50;
$correct-answer-color: #279a39;
$wrong-answer-color: #c22929;
$button-backgroud-color: #eeeeee;

.covidgame {
  max-width: 26.5em;
  padding: 0.75em 1.5em;
  max-height: 100vh;
  margin: 0 auto;
  font-size: 16px;
  display: grid;
  grid-template-rows: auto minmax(60%, 100%) auto;
  grid-gap: 0.75em;

  .score-bar {
    display: flex;
    justify-content: space-between;
    align-items: center;
  }

  .score {
    text-align: left;
    font-size: 1.25em;
    font-weight: bold;
    color: white;
  }

  .starface {
    position: relative;

    > * {
      max-width: 100%;
      max-height: 100%;
    }

    &--img {
      border-radius: 25px;
    }

    &--mask {
      position: absolute;
      top: 0;
    }

    &--morphing {
      position: absolute;
      top: 0;
      border-radius: 25px;

      &--hide {
        display: none;
      }
    }
  }

  .answers {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    grid-gap: 0.75em;

    &--choice {
      min-height: 3.5em;
      text-transform: capitalize;
      padding: 0.5em 1.25em;
      background-color: $button-backgroud-color;
      font-size: 1em;
      border-radius: 1em;
      color: $base-color;
      font-weight: bolder;
      border: none;
      width: 100%;
      max-width: 13em;
      transition: background-color 200ms;

      &:focus {
        outline: none;
      }

      &--wrong {
        background-color: $wrong-answer-color;
        color: white;
      }

      &--correct {
        color: white;
        background-color: $correct-answer-color;
      }
    }
  }

  @media screen and (max-height: 620px) {
    font-size: 12px;
  }

  @media screen and (min-height: 621px) and (max-height: 900px) {
    font-size: 14px;
  }
}
</style>
