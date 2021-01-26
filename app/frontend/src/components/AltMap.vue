<template>
  <vue-datamaps :localData="world"></vue-datamaps>
</template>

<script>
// For different projections, upload to ../map-data/data
// eg. https://github.com/Seungwoo321/vue-datamaps/tree/8f4961c0efa7e48cf69930d2665f492db0cef7a6/src/data
// and https://github.com/Seungwoo321/vue-datamaps/blob/8f4961c0efa7e48cf69930d2665f492db0cef7a6/src/data/index.js
import { world } from '../map-data/data.js';
import { VueDatamaps } from 'vue-datamaps';
export default {
  name: 'vue-map',
  components: {
    VueDatamaps,
  },
  data: function () {
    return {
      world: world,
    };
  },
};
</script>

<style scoped>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
</style>
