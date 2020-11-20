<template>
    <div>
        <div class="hello"></div>
        <div class="starface">
            <img class="starface--img" :src="answerApi[0].url" alt="">
            <img class="starface--mask" v-if="displayMask" src="../assets/mask.png" alt="">
            <img class="starface--aswitem" v-if="!displayMask && seringue" src="../assets/seringue.png" alt="">
            <img class="starface--aswitem" v-if="!displayMask && virus" src="../assets/virus.png" alt="">
            <div>
                <div class="answers">
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
    export default {
        name: 'Covidgame',
        props: {
            msg: String
        },
        //el : 'main',
        data: function () {
            return {
                answerOne: 'Brad Pitt',
                answerTwo: 'Jean Dujardin',
                answerThree: 'Matt Damon',
                answerFour: 'Georges Clooney',
                displayMask: true,
                virus: false,
                seringue: false,
                answerApi: [],
                answerApihh: [],
                requestOptions: {}
            }
        },
        created(){
            this.LoadNewData();
        },
        methods : {
            displayAnimation(result){
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
                    this.LoadNewData(); }.bind(this), 800);
            },
            async LoadNewData(){
                var res;
                await axios.get("http://service.covid-face.com/face")
                    .then( response => {
                        res = response.data;
                    }).catch(error => {
                    });
                this.answerApi = res;
            },

            async sendAnswer(answer){
                // console.log('this.answerApi.HASH = ',this.answerApi[0].hash);
                // console.log('Reponse de l utilisateur = ',answer);
                var res;
                var formdata = new FormData();
                formdata.append("hash", this.answerApi[0].hash);
                formdata.append("response", answer);
                await axios.post("http://service.covid-face.com/face", formdata).then( response => {
                    console.log('RESPONSE = ',response.data);
                    res = response.data;
                }).catch(error => {
                    console.error(error);
                });
                this.answerApihh = res;
                this.displayAnimation(res.result)
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
                padding: 6px 20px;
                background-color: #2c3e50;
                color: white;
                font-size: 18px;
                border-radius: 16px;
                border: none;
                margin: 4px 4px;
                width: 100%;
                max-width: 208px;
                &:hover{
                    opacity: 0.8;
                }
            }
        }
    }
    @media screen and (max-width: 450px){.starface--mask{max-width: 250px;margin-left:-125px;}}
    @media screen and (max-width: 400px){.starface--mask{max-width: 225px;margin-left:-111px;}}
    @media screen and (max-width: 350px){.starface--mask{max-width: 200px;margin-left:-100px;top: 35.5%;}}
    @media screen and (max-width: 300px){.starface--mask{max-width: 165px;margin-left:-82px;top: 33.5%;}}
    @media screen and (max-width: 250px){.starface--mask{max-width: 155px;margin-left:-82px;top: 32.5%;}}

</style>
