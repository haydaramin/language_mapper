<template>
  <div class="flex flex-1 flex-col items-center">
    <h1 class="font-serif text-7xl">Language Mapper</h1>
    <Input class="my-4" />
    <Map />
  </div>
</template>

<script>
import Map from './components/Map.vue';
import Input from './components/Input.vue';
export default {
  name: 'App',
  components: {
    Map,
    Input
  }
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
