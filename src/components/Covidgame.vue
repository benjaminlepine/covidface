<template>
  <div>
    <div class="hello"></div>
    <div class="starface">

      <img class="starface--img" src="../assets/leonardodicaprio.png" alt="">
      <img class="starface--mask" src="../assets/mask2.png" alt="">

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

  .starface{
    position: relative;
    &--img{
      margin-top: 25px;
      border-radius: 25px;
      max-width: 95%;
      max-height: 700px;
    }
    &--mask{
      position: absolute;
      left: 50%;
      margin-left: -151px;
      top: 37%;
      max-width: 320px;
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
  @media screen and (max-width: 450px){.starface--mask{max-width: 295px;margin-left:-140px;}}
  @media screen and (max-width: 400px){.starface--mask{max-width: 270px;margin-left:-130px;}}
  @media screen and (max-width: 350px){.starface--mask{max-width: 240px;margin-left:-115px;top: 35%;}}
  @media screen and (max-width: 300px){.starface--mask{max-width: 200px;margin-left:-95px;top: 34%;}}
  @media screen and (max-width: 250px){.starface--mask{max-width: 170px;margin-left:-82px;top: 33%;}}


</style>
