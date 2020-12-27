<template>
    <div>
        <div class="starface">
<!--            <Hourglass/>-->
            <p class="score score-ctn mb-0">SCORE: {{answerApihh.score}}</p>
            <img class="starface--img" :src="answerApi[0].url" alt="masked star face">
<!--            <img class="hourglass" src="../assets/hourglass.svg" alt="hourglass">-->
            <img class="starface--mask" v-if="displayMask" src="../assets/mask.png" alt="">
            <img class="starface--aswitem" v-if="!displayMask && seringue" src="../assets/seringue.png" alt="">
            <img class="starface--aswitem" v-if="!displayMask && virus" src="../assets/virus.png" alt="">
            <div>
                <div class="answers mt-1">
                    <button v-on:click="sendAnswer(answerApi[0].choices[0])" class="answers--choice">{{answerApi[0].choices[0]}}</button>
                    <button v-on:click="sendAnswer(answerApi[0].choices[1])" class="answers--choice">{{answerApi[0].choices[1]}}</button>
                </div>
                <div class="answers">
                    <button v-on:click="sendAnswer(answerApi[0].choices[2])" class="answers--choice">{{answerApi[0].choices[2]}}</button>
                    <button v-on:click="sendAnswer(answerApi[0].choices[3])" class="answers--choice">{{answerApi[0].choices[3]}}</button>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    import axios from 'axios';
    import store from '../store/index.js';
    import Hourglass from '../animations/Hourglass'

    export default {
        name: 'Covidgame',
        components: { Hourglass },
        props: {
            msg: String,
            argent: String
        },
        //el : 'main',
        data: function () {
            return {
                displayMask: true,
                virus: false,
                seringue: false,
                answerApi: [],
                answerApihh: [],
                requestOptions: {},
                store: store
            }
        },
        created(){
            this.LoadNewData();
        },
        methods : {
            displayAnimation(result, gameId) {
                this.displayMask = false;
                if(!result){
                    this.virus = true;
                    setTimeout(function () { this.virus = false; }.bind(this), 800);
                }
                if(result){
                    this.seringue = true;
                    setTimeout(function () { this.seringue = false; }.bind(this), 800);
                }
                setTimeout(function () {
                    this.displayMask = true;
                    this.LoadNewData(gameId); }.bind(this), 800);

            },

            loadEndgame(){
                this.$router.push('/EndGame');
            },

            async LoadNewData(gameId){
                var res;

                if (gameId != undefined) {
                    var params = {
                        params: {
                            gameId: gameId
                        }
                    };
                } else {
                    var params = {};
                }
                await axios.get("http://service.covid-face.com/face", params)
                    .then( response => {
                        res = response.data;
                        if(res[0].game_end){
                            this.loadEndgame();
                        }
                    }).catch(error => {
                    });
                this.answerApi = res;
            },
            async sendAnswer(answer){
                var res;
                var formdata = new FormData();
                formdata.append("hash", this.answerApi[0].hash);
                formdata.append("response", answer);
                formdata.append("gameId", this.answerApi[0].gameId);

                await axios.post("http://service.covid-face.com/face", formdata).then( response => {
                    //console.log('RESPONSE POST = ',response.data);
                    res = response.data;
                }).catch(error => {
                    console.error(error);
                });
                this.answerApihh = res;
                // Store score in global store
                store.state.score = this.answerApihh.score;
                this.displayAnimation(res.result, res.gameId)
            }
        }
    }
</script>


<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">

    $base-color: #2c3e50;
    $answer-color: #279a39;

    .score{
        text-align: center;
        font-size: 18px;
        font-weight: bold;
    }
    .score-ctn{
        position: absolute;
        margin-left: 30%;
        z-index: 2;
        color: white;
    }

    .score-ctn2{
        position: absolute;
    }
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
            margin-left: -128px;
            top: 37%;
            max-width: 265px;
        }
        &--aswitem{
            position: absolute;
            left: 50%;
            margin-left: -60px;
            top: 67%;
            max-width: 120px;
        }
        .answers {
            display: flex;
            justify-content: center;
            align-items: center;

            &--choice {
                min-height: 60px;
                text-transform: capitalize;
                padding: 6px 20px;
                background-color: #eeeeee;
                font-size: 18px;
                border-radius: 16px;
                color: $base-color;
                font-weight: bolder;
                border: none;
                margin: 4px 4px;
                width: 100%;
                max-width: 208px;
                transition: background-color 200ms;
                &:hover{//opacity: 0.8;
                }
                &:focus{
                    outline: none;
                    //background-color: #2694ab;
                }
                //&:active{background-color: #1d6273;}
            }
        }

        /*.hourglass {*/
        /*    position: absolute;*/
        /*    max-width: 32px;*/
        /*    animation: rotation 3s infinite linear;*/
        /*}*/

        /*@keyframes rotation {*/
        /*    from { transform: rotate(0deg); }*/
        /*    to { transform: rotate(359deg); }*/
        /*}*/
    }
    @media screen and (max-width: 450px){.starface--mask{max-width: 250px;margin-left:-125px;}}
    @media screen and (max-width: 400px){.starface--mask{max-width: 225px;margin-left:-111px;}}
    @media screen and (max-width: 350px){.starface--mask{max-width: 200px;margin-left:-100px;top: 35.5%;}}
    @media screen and (max-width: 300px){.starface--mask{max-width: 165px;margin-left:-82px;top: 33.5%;}}
    @media screen and (max-width: 250px){.starface--mask{max-width: 155px;margin-left:-82px;top: 32.5%;}}

</style>
