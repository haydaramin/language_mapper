<template>
  <input v-model="input" placeholder="word" class="shadow-lg rounded text-center"/>
</template>

<script>
export default {
  name: 'Input',
  data: function () {
    return {
      input: '',
    };
  },
};
</script>

<style scoped>
</style>
