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
    /*&--ctn{*/
    /*  width: 220px;*/
    /*  background-color: red;*/
    /*  margin-left: 523px;*/
    /*  overflow: hidden;*/
    /*}*/
    /*&--blur{*/
    /*  width: 600px;*/
    /*  height: 600px;*/
    /*  position: absolute;*/
    /*  filter: blur(6px);*/
    /*}*/
    /*&--mask{*/
    /*  position: absolute;*/
    /*  max-width: 320px;*/
    /*  max-height: 320px;*/
    /*  margin-left: 130px;*/
    /*  margin-top: 280px;*/
    /*}*/
    /*&--visiere{*/
    /*  position: absolute;*/
    /*  max-width: 450px;*/
    /*  height: 450px;*/
    /*  margin-left: 110px;*/
    /*  margin-top: 130px;*/
    /*}*/
  }

  /*.c{*/
  /*  text-align: center;*/
  /*  position: center;*/
  /*}*/

  .answers{
    display: flex;
    justify-content: center;
    align-items: center;
    &--choice{
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

  /*
  .blurred-bg-container .content h1 {
    margin: 0;
  }

  .blurred-bg-container {
    background: url(https://t1.ldh.be/NTVkzg70d18uNfIMiN20NCzEpto=/0x70:2432x1283/1920x960/5f50f10bd8ad586219e18073.jpg);
    height: 100vh;
    background-size: cover;
  }

  .blurred-bg-container .content {
    background: inherit;
    width: 60%;
    height: 40%;
    border-radius: 8px;
    box-shadow: 0 0 32px rgba(0, 0, 0, 0.5);
    position: absolute;
    top: 50%;
    left: 40%;
    transform: translate(-50%, -50%);
    overflow: hidden;
  }

  .blurred-bg-container .text {
    padding: 16px;
    background: rgba(255, 255, 255, 0.3);
    height: 100%;
    box-sizing: border-box;
  }


  .blurred-bg-container .blur {
    background: inherit;
    height: 100vh;
    width: 166.667%;
    position: absolute;
    left: 0;
    top: 0;
    transform: translate(
                    -10%,
                    -30%
    );
    filter: blur(20px);
    z-index: -1;
  }
  */


</style>
