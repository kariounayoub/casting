import Vue from 'vue';
import Vuetify from 'vuetify';
import '../stylus/main.styl';
import '@mdi/font/css/materialdesignicons.css';


Vue.use(Vuetify, {
  iconfont: 'md',
  options: {
    customProperties: true
  },
  theme: {
    primary: '#29ABE2',
    secondary: '#4caf50',
    tertiary: '#495057',
    accent: '#82B1FF',
    error: '#B0303D',
    info: '#00d3ee',
    success: '#59E02A',
    warning: '#ffa21a',
  }

});
