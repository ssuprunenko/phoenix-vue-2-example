<template>
  <div class="dt w-100 pb2 mt2">
    <div class="dtc w2 w3-ns">
      <img :src="msg.avatarUrl" class="ba b--black-10 db br2 w-90 w-70-ns" />
    </div>
    <div class="dtc v-top pl0-ns pl2">
      <h2 class="f6 f5-ns fw5 black mv0">
        {{msg.name}}
        <span class="black-40 f6 fw5 pl1">{{msg.date}}</span>
      </h2>
      <div class="mt0 mt1-ns f6 f5-ns lh-title black-80 message">
        <em v-if="msg.isSystem" class="black-50">{{msg.text}}</em>
        <div v-else v-html="parsedText"></div>
      </div>
    </div>
  </div>
</template>

<script>
  export default {
    props: ['msg'],
    computed: {
      parsedText () {
        return marked(this.msg.text)
      }
    }
  }
</script>

<style>
  .message p {
    margin: 0;
  }
</style>
