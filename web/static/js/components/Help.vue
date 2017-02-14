<template>
  <div>
    <h2 class="f3 fw5">Help</h2>
    <ul class="list pl0 lh-copy">
      <li v-for='link in links'>
        <a :href='link.url' class="dim blue">{{link.title | upcase}}</a>
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  data () {
    return {
      links: [
        {
          url: 'http://groups.google.com/group/phoenix-talk',
          title: 'Mailing list'
        },
        {
          url: 'http://webchat.freenode.net/?channels=elixir-lang',
          title: '#elixir-lang on freenode IRC'
        },
        {
          url: 'https://twitter.com/elixirphoenix',
          title: '@elixirphoenix'
        }
      ]
    }
  },
  filters: {
    upcase (value) {
      return value.toUpperCase()
    }
  }
}
</script>
