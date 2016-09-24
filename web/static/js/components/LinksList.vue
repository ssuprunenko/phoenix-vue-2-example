<template>
  <div>
    <h3>Links List components</h3>
    <div v-for="link in links">
      <p>{{ link.host }}</p>
      <p>{{ link.path }}</p>
    </div>
  </div>
</template>

<script>
  export default {
    props: {
      links: {
        type: Array,
        default () {
          return []
        }
      }
    }
  }
</script>
