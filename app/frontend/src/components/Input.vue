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
import translate from 'translate';
export default {
  name: 'Input',
  data: function() {
    return {
      input: ''
    };
  },
  mounted() {
    translate.engine = 'google';
    // translate.key = process.env.TRANSLATE_KEY;
    translate.key = '../../keys.json';
  },
  methods: {
    async translate() {
      const asdf = await translate('input', 'es');
      alert(asdf);
    }
  }
};
</script>

<style scoped></style>
