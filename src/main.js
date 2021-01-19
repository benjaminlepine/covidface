import Vue from 'vue'
import App from './App.vue'
import './registerServiceWorker'
import router from './router'
import store from './store'
import BootstrapVue from 'bootstrap-vue/dist/bootstrap-vue.esm';
import 'bootstrap/dist/css/bootstrap.css';
import 'bootstrap-vue/dist/bootstrap-vue.css';
//import LoadScript from 'vue-plugin-load-script';
Vue.use(BootstrapVue);
//Vue.use(LoadScript);
Vue.config.productionTip = false


// Vue.loadScript("./node_local/imgwarp.js").then(() => {
//   ImgWarper.ggg();
// }).catch(() => {
//       console.log("ERROR GGG");
//     });


new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app');
