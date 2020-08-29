<template>
  <div class="hello">
    <!--    <h1>{{ msg }}</h1>-->
    <div class="starface">
      <img class="starface--img" src="../assets/brad.jpg" alt="">
      <img class="starface--mask" src="../assets/mask.png">
    </div>


      <div class="answers">
        <button v-on:click="sendAnswer(answerOne)" class="answers--choice">{{answerOne}}</button>
        <button v-on:click="sendAnswer(answerTwo)" class="answers--choice">{{answerTwo}}</button>
      </div>
      <div class="answers">
        <button v-on:click="sendAnswer(answerThree)" class="answers--choice">{{answerThree}}</button>
        <button v-on:click="sendAnswer(answerFour)" class="answers--choice">{{answerFour}}</button>
      </div>


  </div>
</template>

<script>
  export default {
    name: 'HelloWorld',
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
    left: -300px;
    height: 630px;
    &--img{
      position: absolute;
      border-radius: 40px;
      max-width: 600px;
      max-height: 600px;
    }
    &--mask{
      position: absolute;
      max-width: 320px;
      max-height: 320px;
      margin-left: 130px;
      margin-top: 280px;
    }
  }

  .c{
    text-align: center;
    position: center;

  }
  .answers{
    display: flex;
    justify-content: center;
    align-items: center;
    &--choice{
      padding: 6px 20px;
      background-color: #2c3e50;
      color: white;
      border-radius: 16px;
      border: none;
      margin: 4px 15px;
    }
  }

</style>
