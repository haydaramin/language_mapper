import Vue from 'vue';
import App from './App.vue';
import 'tailwindcss/tailwind.css';
import VueDatamaps from 'vue-datamaps'

Vue.use(VueDatamaps)
Vue.config.productionTip = false;

new Vue({
  render: h => h(App)
}).$mount('#app');
