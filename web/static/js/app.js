import 'phoenix_html'

// Vendor
import Vue from 'vue'
import VueResource from 'vue-resource'
import Chart from 'chart.js'
import marked from 'marked'

// Components
import Help from './components/Help.vue'
import Graph from './components/Graph.vue'
import MessageList from './components/MessageList.vue'
import RepoLinks from './components/RepoLinks.vue'

Vue.use(VueResource)
Vue.http.options.root = '/api'

new Vue({
  el: 'main',
  components: {
    Help,
    Graph,
    MessageList,
    RepoLinks
  }
})
