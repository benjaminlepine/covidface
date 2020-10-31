<template>
  <div class="game-ctn">
    <div class="hello"></div>
      <div class="starface">
        <img class="starface--img" src="../assets/leonardodicaprio.png" alt="">
        <div>
        <div class="answers">
          <button v-on:click="sendAnswer(answerOne)" class="answers--choice">{{answerOne}}</button>
          <button v-on:click="sendAnswer(answerTwo)" class="answers--choice">{{answerTwo}}</button>
        </div>
        <div class="answers">
          <button v-on:click="sendAnswer(answerThree)" class="answers--choice">{{answerThree}}</button>
          <button v-on:click="sendAnswer(answerFour)" class="answers--choice">{{answerFour}}</button>
        </div>
        </div>
      </div>
    </div>
</template>

<script>
  export default {
    name: 'Covidgame',
    props: {

      msg: String
    },
    el : 'main',
    data: function () {
      return {
        answerOne: 'Brad Pitt',
        answerTwo: 'Jean Dujardin',
        answerThree: 'Matt Damon',
        answerFour: 'Georges Clooney',
      }
    },
    methods : {
      sendAnswer(answer){
        // axios.post('/your-url', {name: this.name})
        //         .then(res => {
        //           // do something with res
        //         })
        //         .catch(err => {// catch error});
        //         }
        console.log('Your answer is = ', answer)
      }

    }

}
</script>


<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">

  .game-ctn{
    max-height: 100%;
  }
  .starface{
    position: relative;
    &--img{
      margin-top: 25px;
      border-radius: 25px;
      max-width: 95%;
      max-height: 700px;
    }
  .answers {
    display: flex;
    justify-content: center;
    align-items: center;

    &--choice {
      min-height: 60px;
      padding: 6px 20px;
      background-color: #2c3e50;
      color: white;
      font-size: 18px;
      border-radius: 16px;
      border: none;
      margin: 4px 4px;
      width: 100%;
      max-width: 208px;
    }
  }
  }
</style>
