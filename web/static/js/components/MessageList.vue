<template>
  <div>
    <input v-model="currentMessage" @keyup.enter="pushMessage" type="text"></input>
    <ul>
      <li v-for='msg in messages'>{{msg}}</li>
    </ul>
  </div>
</template>

<script>
  import socket from '../socket'
  const channel = socket.channel('room:lobby', {})
  channel.join()

  export default {
    data () {
      return {
        messages: [],
        currentMessage: 'Start'
      }
    },
    mounted () {
      channel.on('new_msg', payload => {
        this.messages.push(payload.body)
      })
    },
    methods: {
      pushMessage () {
        channel.push('new_msg', { body: this.currentMessage })
        this.currentMessage = ''
      }
    }
  }
</script>
