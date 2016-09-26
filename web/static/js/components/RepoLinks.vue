<template>
  <div>
    <repo-link v-for="link in links" :link="link"></repo-link>
  </div>
</template>

<script>
  import RepoLink from './RepoLink.vue'

  export default {
    props: {
      links: {
        type: Array,
        default () {
          return []
        }
      }
    },
    components: {
      RepoLink
    }
  }
</script>
