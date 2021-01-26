<template>
  <div class="flex flex-1 flex-col items-center">
    <div>
      <input
        v-model="input_text"
        placeholder="word"
        class="shadow rounded text-center m-2 p-1"
        @keyup.enter="get_meanings()"
      />
      <button @click="get_meanings()" class="bg-white text-gray-600 shadow px-2 py-1 rounded m-2">Search</button>
    </div>
    <div
      v-if="definitions.length > 0 && show_definitions"
      class="h-64 w-1/3 overflow-auto border-grey-100 border-2 rounded shadow"
    >
      <button
        v-for="(definition, i) in definitions"
        :key="i"
        class="bg-white shadow p-1 rounded m-2"
        @click="get_translations(meaning_ids[i])"
      >
        {{ definition.split(';')[0] }}
        <!-- TODO: puts the example sentences (definition.split(";").slice(1)) somewhere (on hover?) -->
      </button>
    </div>
  </div>
</template>

<script>
import api from '@/api.js';
export default {
  name: 'Input',
  data: function () {
    return {
      input_text: '',
      saved_input: '',
      definitions: {},
      parts_of_speech: {},
      meaning_ids: {},
      show_definitions: false,
    };
  },
  methods: {
    async get_meanings() {
      this.saved_input = this.input_text; // for the 2nd api call in case input changes later
      const meanings = await api.get_meanings('eng', this.saved_input);
      this.definitions = meanings[0]['definitions'];
      this.parts_of_speech = meanings[1]['parts_of_speech'];
      this.meaning_ids = meanings[2]['meaning_ids'];
      this.show_definitions = true;
    },
    async get_translations(meaning_id) {
      console.log(meaning_id);
      this.show_definitions = false;
      // TODO: api request -> hand off data to maps component (use vuex?), or let maps do the api request?
    },
  },
};
</script>

<style scoped></style>
