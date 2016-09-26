import 'phoenix_html'

// Vendor
import Vue from 'vue'
import VueResource from 'vue-resource'

// Components
import Help from './components/Help.vue'
import Chart from './components/Chart.vue'
import MessageList from './components/MessageList.vue'
import RepoLinks from './components/RepoLinks.vue'

Vue.use(VueResource)
Vue.http.options.root = '/api'

new Vue({
  el: 'main',
  components: {
    Help,
    Chart,
    MessageList,
    RepoLinks
  }
})
