<template>
  <div class="spinner">
    <div class="spinner__circle spinner__circle--circle-1"></div>
    <div class="spinner__circle spinner__circle--circle-2"></div>
  </div>
</template>
<script>
export default {
  data: function () {
    return {};
  },
  methods: {},
};
</script>
<style lang="scss">
.spinner {
  width: 60px;
  height: 60px;
  border-radius: 100%;
  position: relative;

  &__circle {
    content: "";
    position: absolute;
    width: 100%;
    height: 100%;
    border-radius: 100%;
    border: calc(60px / 10) solid transparent;

    &--circle-1 {
      border-top-color: #000327;
      animation: spinner-animation 1s infinite;
    }

    &--circle-2 {
      border-bottom-color: #000327;
      animation: spinner-animation 1s infinite alternate;
    }
  }
}

@keyframes spinner-animation {
  0% {
    transform: rotate(0deg);
  }
  100% {
    transform: rotate(360deg);
  }
}
</style>
