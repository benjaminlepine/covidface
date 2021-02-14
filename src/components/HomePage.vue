<template>
  <div class="home-ctn pt-3">
    <img class="home-macron" src="../assets/macron.png" alt="" />
    <h1 class="home-title mt-4">COVID-FACE</h1>
    <div class="home-subtitle">
      <h2>Trouvez quelle star se cache sous le masque.</h2>
      <p>
        Jouez au quiz du coronavirus et identifiez les stars masquées.
        Serez-vous capable d'obtenir le meilleur score
      </p>
    </div>
    <router-link to="/Covidgame" class="btn covid-btn covid-btn--start"
      >Commencer</router-link
    ><br />
    <div class="categories-ctn mb-5">
      <h1>CATEGORIES</h1>
      <div class="categories-list">
        <router-link
          class="categories-element col"
          v-for="{ slug, name } in categories"
          :key="slug"
          :to="`/Covidgame/${slug}`"
        >
          <img
            class="categories-element-icn"
            :src="getAssetUrl(slug)"
            :alt="slug"
          />
          <p class="categories-element-subtitle">{{ name }}</p>
        </router-link>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "HomePage",
  data: function () {
    return {
      categories: [
        { name: "Cinéma", slug: "cinema" },
        { name: "Football", slug: "football" },
      ],
    };
  },
  methods: {
    getAssetUrl: (slug) => {
      return require(`../assets/${slug}.png`);
    },
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
@import "../style";
.home {
  &-ctn {
    padding-bottom: 20px;
    min-height: 900px;
  }
  &-macron {
    max-width: 120px;
  }
  &-title {
    color: #acd3f7;
    font-size: 45px;
    font-family: Coronaviral, Calibri, sans-serif;
    margin-bottom: 0;
  }
  &-subtitle {
    margin: 10px 0 10px 0;
    color: #acd3f7;
  }
}

.categories {
  &-ctn {
    & h1 {
      color: #5ff759;
      font-size: 35px;
      font-family: Coronaviral, "Times New Roman", Times, sans-serif;
    }

    border: 2px solid #5ff759;
    border-radius: 30px;
    padding: 15px;
    margin: 30px;
  }

  &-list {
    display: grid;
    grid-template-columns: 1fr 1fr;
    grid-gap: 1em;
  }

  &-element {
    transition: filter 300ms, opacity 300ms, transform 0.8s ease-in-out;
    -webkit-transition: -webkit-transform 0.4s ease-in-out;
    padding: 0px;

    &:hover {
      filter: brightness(1.25);
      cursor: pointer;
      -webkit-transform: rotate(10deg);
      transform: rotate(10deg);
      border-radius: 20%;
      border-color: #536d8a;
    }

    &-icn {
      max-width: 100px;
    }

    &-subtitle {
      color: #a2c2e3;
      margin-bottom: 0;
      font-size: 18px;
      font-family: Helvetica;
    }
  }
}
</style>
