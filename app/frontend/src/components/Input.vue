<template>
  <div class="input">
    <input
      v-model="input"
      placeholder="word"
      class="shadow-lg rounded text-center"
    />
    <button @click="translate()" class="button">Search</button>
  </div>
</template>

<script>
import api from '@/api.js';
export default {
  name: 'Input',
  data: function() {
    return {
      input: ''
    };
  },
  methods: {
    async translate() {
      const translations = await api.translate('input', 'eng');
      alert(translations);
    }
  }
};
</script>

<style scoped></style>
