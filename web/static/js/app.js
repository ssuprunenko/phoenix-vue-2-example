// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import 'phoenix_html'
import Vue from 'vue/dist/vue.js'
import VueResource from 'vue-resource'

// Components
import Help from './components/help'
import Chart from './components/chart'

Vue.use(VueResource)
Vue.http.options.root = '/api'

Vue.component('chart', Chart)
Vue.component('help', Help)

new Vue({
  el: '#app'
})

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

// import socket from "./socket"
