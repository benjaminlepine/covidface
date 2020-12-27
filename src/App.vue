<template>
  <div id="app">
    <router-view/>
  </div>
</template>

<style lang="scss">

  @font-face {
    font-family: "Coronaviral";
    src: local("Coronaviral"),
    url(./fonts/Coronaviral.ttf) format("truetype");
  }

#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  height: auto;
  color: #2c3e50;
  min-height: 100%;
  background-image: linear-gradient(#34A2E3, #000327);
}
  
#nav {
  padding: 30px;
  a {
    font-weight: bold;
    color: #2c3e50;
    &.router-link-exact-active {
      color: #42b983;
    }
  }
}
</style>
