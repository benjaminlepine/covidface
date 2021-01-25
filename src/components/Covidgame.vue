<template>
    <div>
                <div class="starface">
        <!--            <Hourglass/>-->
                    <p class="score score-ctn mb-0">SCORE:
                        <span v-if="!answerApihh.score || answerApihh.score === 0">0</span>
                        {{answerApihh.score}}
                    </p>
                    <div class="starface--ctn-face">
                        <img class="starface--img" :src="answerApi[0].url[0]" alt="masked star face" @load="onFirstImageLoad">
                        <img class="starface--img starface--img--hide" :src="answerApi[0].url[1]" alt="masked star face" @load="onSecondImageLoad">
                        <canvas v-if="answerApi[0]" class="starface--morphing starface--morphing--hide" ref="canvas1" height="702" width="425" />
                        <canvas v-if="answerApi[0]" class="starface--morphing starface--morphing--hide" ref="canvas2" height="702" width="425" />
                        <canvas v-if="answerApi[0]" class="starface--morphing" ref="result" height="702" width="425" />
        <!--                <img class="starface--img" src="../assets/Aaron-Eckhart.jpg" alt="masked star face">-->
                        <img class="starface--mask" v-if="displayMask" src="../assets/mask.png" alt="">
                        <img class="starface--aswitem" v-if="!displayMask && seringue" src="../assets/seringue.png" alt="">
                        <img class="starface--aswitem" v-if="!displayMask && virus" src="../assets/virus.png" alt="">
                    </div>
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

        data: function () {
            return {
                displayMask: true,
                virus: false,
                seringue: false,
                answerApi: [],
                answerApihh: [],
                requestOptions: {},
                store: store,
                animator: null,
                frames: [],
                warper: {}
            }
        },
        created(){
            this.LoadNewData();

        },
        mounted(){
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
                    this.draw();
                    setTimeout(function () { this.seringue = false; }.bind(this), 800);
                }
                setTimeout(function () {
                    this.displayMask = true;
                    this.LoadNewData(gameId); }.bind(this), 800);

            },

            loadEndgame(){
                this.$router.push('/EndGame');
            },

            onFirstImageLoad(event){
                const img = event.target;
                img.crossOrigin = "Anonymous";
                const target = "canvas1";
                const canvas = this.$refs[target];
                this.loadImage(target, canvas, img);
                const points = [
                    { x: 0, y: 0 },
                    { x: 425, y: 0 },
                    { x: 0, y: 702 },
                    { x: 425, y: 702 },
                    { x: 75, y: 400 },
                    { x: 355, y: 400 },
                    { x: 155, y: 608 },
                    { x: 280, y: 608 },
                    { x: 212, y: 125 },
                    { x: 212, y: 238 },
                    { x: 212, y: 342 },
                    { x: 212, y: 485 },
                    { x: 148, y: 295 },
                    { x: 284, y: 295 },
                    { x: 147, y: 409 },
                    { x: 276, y: 409 },
                    { x: 168, y: 392 },
                    { x: 255, y: 392 },
                    { x: 212, y: 445 },
                ];
                for (let x = 0; x < points.length; x++) {
                    points[x] = new ImgWarper.Point(points[x].x, points[x].y);
                }
                this.warper[target].oriPoints = points;
                this.warper[target].dstPoints = points;
            },

            onSecondImageLoad(event) {
                const img = event.target;
                img.crossOrigin = "Anonymous";
                const target = "canvas2";
                const canvas = this.$refs[target];
                this.loadImage(target, canvas, img);
                const points = [
                    { x: 0, y: 0 },
                    { x: 425, y: 0 },
                    { x: 0, y: 702 },
                    { x: 425, y: 702 },
                    { x: 75, y: 400 },
                    { x: 355, y: 400 },
                    { x: 155, y: 608 },
                    { x: 280, y: 608 },
                    { x: 212, y: 125 },
                    { x: 212, y: 238 },
                    { x: 212, y: 342 },
                    { x: 212, y: 485 },
                    { x: 148, y: 295 },
                    { x: 284, y: 295 },
                    { x: 135, y: 394 },
                    { x: 288, y: 395 },
                    { x: 167, y: 379 },
                    { x: 258, y: 380 },
                    { x: 212, y: 437 },
                ];
                for (let x = 0; x < points.length; x++) {
                    points[x] = new ImgWarper.Point(points[x].x, points[x].y);
                }
                this.warper[target].oriPoints = points;
                this.warper[target].dstPoints = points;
                this.animator = new ImgWarper.Animator(
                    this.warper["canvas1"],
                    this.warper["canvas2"]
                );
                this.animator.generate(7);
                this.frames = this.animator.frames;
                this.frames.push(
                    canvas.getContext("2d").getImageData(0, 0, img.width, img.height)
                );
            },

            loadImage(target, canvas, img) {
                const ratio = canvas.width / img.width; // set canvas size big enough for the image
                canvas.height = img.height * ratio;
                const ctx = canvas.getContext("2d");
                ctx.drawImage(
                    img,
                    0,
                    0,
                    img.width,
                    img.height,
                    0,
                    0,
                    canvas.width,
                    canvas.height
                );
                img.width = canvas.width;
                img.height = canvas.height;
                const imageData = ctx.getImageData(0, 0, img.width, img.height);
                if (this.warper[target]) delete this.warper[target];
                this.warper[target] = new ImgWarper.PointDefiner(canvas, img, imageData);
            },

            draw() {
                function myLoop(frames, context, i) {
                    setTimeout(() => {
                    context.putImageData(frames[i], 0, 0);
                    if (i < frames.length - 1) {
                        myLoop(frames, context, i + 1);
                    }
                    }, 40);
                }

                const context = this.$refs.result.getContext("2d");
                myLoop(this.frames, context, 0);
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
                console.log("answerApi[0].url = ", this.answerApi[0].url);
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
            },
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
        z-index: 2;
        color: white;
    }

    .score-ctn2{
        position: absolute;
    }
    .starface{
        max-width: 425px;
        margin: 0 auto;
        &--ctn-face{position: relative;}
        &--img{
            margin-top: 25px;
            border-radius: 25px;
            height: 702px;
            width: 425px;

            &--hide{
                z-index: -1;
                position: absolute;
            }
        }
        &--mask{
            position: absolute;
            left: 50%;
            margin-left: -128px;
            top: 43%;
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
        &--morphing{
            position: absolute;
            top: 25px;
            left: 0;

            &--hide{
                display: none;
            }
        }


        // Broken imgwarp css class
        .img {display: inline-block;}
        .frames img {width: 164px;}


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
    @media screen and (max-width: 350px){.starface--mask{max-width: 200px;margin-left:-100px;}}
    @media screen and (max-width: 300px){.starface--mask{max-width: 165px;margin-left:-82px;}}
    @media screen and (max-width: 250px){.starface--mask{max-width: 155px;margin-left:-82px;}}

</style>
