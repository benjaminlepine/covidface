<template>
  <div class="hello">
    <!--    <h1>{{ msg }}</h1>-->
    <!--    <div class="starface">
          <img class="starface&#45;&#45;img" src="../assets/brad.png" alt="">
    &lt;!&ndash;      <img class="starface&#45;&#45;mask" src="../assets/mask.png">&ndash;&gt;
        </div>-->


    <!--      <div class="answers">
            <button v-on:click="sendAnswer(answerOne)" class="answers&#45;&#45;choice">{{answerOne}}</button>
            <button v-on:click="sendAnswer(answerTwo)" class="answers&#45;&#45;choice">{{answerTwo}}</button>
          </div>
          <div class="answers">
            <button v-on:click="sendAnswer(answerThree)" class="answers&#45;&#45;choice">{{answerThree}}</button>
            <button v-on:click="sendAnswer(answerFour)" class="answers&#45;&#45;choice">{{answerFour}}</button>
          </div>-->

    <div class="blurred-bg-container">
      <div class="content">
        <div class="blur"></div>
      </div>
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

.blurred-bg-container{
  background-image: url("../assets/brad.png");
  height: 700px;
  width: 500px;
  position: relative;
  left: -250px;
  margin-left: 50%;
}

.blurred-bg-container .content{
  background: inherit;
  width: 60% /* cw */;
  height: 40% /* ch */;
  border-radius: 25px 25px 0 0;
  position: absolute;
  top: 60.5% /* ct */;
  left: 40% /* cl */;
  transform: translate(-50%, -50%);
  overflow: hidden;
}

.blurred-bg-container .blur{
  background: inherit;
  height: 100vh /* h */;
  width: 166.667%;
  position: absolute;
  left: 0;
  top: 0;
  transform: translate(-10%, -30%); /* (100/cl)*(100-cw)%, (100/ct)*(100-ch) */
  filter: blur(4px);
}

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
