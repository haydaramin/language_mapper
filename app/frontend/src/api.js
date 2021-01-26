import axios from 'axios';

export default {
  // /lang/word
  // Returns a list of possible definitions along with their parts of speech and meaning identifiers. See sample1.js for an example.
  get_meanings: (lang, word) => {
    return axios
      .get(`${process.env.VUE_BACKEND_HOST || 'http://localhost:4567'}/${lang}/${word}`)
      .then(function (response) {
        return response.data;
      });
  },
  // TODO: /lang/word/identifier/translate
  // Returns a list of translations. See sample2.js for an example
};
