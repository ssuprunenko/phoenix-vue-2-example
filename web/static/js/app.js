import 'phoenix_html'
import Vue from 'vue/dist/vue.js'
import VueResource from 'vue-resource'

// Components
import Help from './components/Help.vue'
import Chart from './components/Chart.vue'
import MessageList from './components/MessageList.vue'

Vue.use(VueResource)
Vue.http.options.root = '/api'

Vue.component('chart', Chart)
Vue.component('help', Help)
Vue.component('message-list', MessageList)

new Vue({
  el: '#app'
})
