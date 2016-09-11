<template>
  <div class="media message">
    <div class="media-left">
      <a href="#">
        <img :src="msg.avatarUrl" class="avatar">
      </a>
    </div>
    <div class="media-body">
      <h5 class="media-heading">
        {{msg.name}}
        <small>{{msg.date}}</small>
      </h5>
      <em v-if="msg.isSystem" class="text-muted">{{msg.text}}</em>
      <div v-else v-html="parsedText"></div>
    </div>
  </div>
</template>

<script>
  import marked from 'marked'

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
  .message .avatar {
    width: 40px;
    height: 40px;
    border-radius: 10%;
  }

  .message .media-body {
    overflow: visible;
  }

  .message p {
    margin: 0;
  }
</style>
