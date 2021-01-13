<template>
  <vueWorldMap countryData />
</template>

<script>
import vueWorldMap from '../map/Map-App.vue';
export default {
  name: 'Map',
  components: {
    vueWorldMap,
  },
  props: {
    word: String,
  },
  data: function () {
    return {
      countryData: {
        US: 100,
        CA: 120,
        UK: 400,
      },
    };
  },
};
</script>

<style scoped></style>
