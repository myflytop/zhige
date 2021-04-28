import Vue from 'vue'
import App from './App'
import aLoadMore from "./components/a_loadMore.vue";
import uView from "uview-ui"
import request from './utils/http.js'
Vue.use(uView);


Vue.component('aLoadMore',aLoadMore)

Vue.config.productionTip = false;
Vue.prototype.$http = request

App.mpType = 'app'

const app = new Vue({
    ...App
})
app.$mount()
