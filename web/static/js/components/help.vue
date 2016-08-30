<template>
  <div class="col-lg-6">
    <h4>Help</h4>
    <ul>
      <li v-for="link in links">
        <a :href="link.url">{{link.title | upcase}}</a>
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  data() {
    return {
      links: [
        {
          url: "http://groups.google.com/group/phoenix-talk",
          title: "Mailing list"
        },
        {
          url: "http://webchat.freenode.net/?channels=elixir-lang",
          title: "#elixir-lang on freenode IRC"
        },
        {
          url: "https://twitter.com/elixirphoenix",
          title: "@elixirphoenix"
        }
      ]
    };
  },
  filters: {
    upcase(value) {
      return value.toUpperCase()
    }
  }
};
</script>

<style lang="css">
</style>
