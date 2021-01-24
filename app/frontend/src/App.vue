<template>
  <div class="flex flex-1 flex-col items-center">
    <h1 class="font-serif mt-8 text-7xl">Language Mapper</h1>
    <Input class="my-4" />
    <div class="m-4 w-full h-full">
      <Map />
      <AltMap />
    </div>
  </div>
</template>

<script>
import Map from './components/Map.vue';
import AltMap from './components/AltMap.vue';
import Input from './components/Input.vue';
export default {
  name: 'App',
  components: {
    Map,
    AltMap,
    Input,
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
