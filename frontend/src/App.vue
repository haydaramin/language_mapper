<template>
<div class="flex-1 flex-col mt-10">
  <h1 class="font-serif text-7xl">Header Text</h1>
  <div class="my-4"><Input /></div>
  <div><Map /></div>
  <div>3</div>


</div>
</template>

<script>
import Input from './components/Input.vue';
import Map from './components/Map.vue';

export default {
  name: 'App',
  components: {
    Input,
    Map,
  },
};
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
</style>
