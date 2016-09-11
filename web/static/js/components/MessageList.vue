<template>
  <div>
    <div class="form-group">
      <input
        v-model="currentMessage"
        @keyup.enter="pushMessage"
        type="text"
        class="form-control"
        placeholder="Message #random"
      />
    </div>

    <message v-for="msg in messages" :msg="msg" />
  </div>
</template>

<script>
  import Message from './Message.vue'

  import socket from '../socket'
  const channel = socket.channel('room:lobby', {})

  export default {
    data () {
      return {
        messages: [],
        currentMessage: '',
        name: `User ${Math.floor(Math.random() * 10000)}`
      }
    },
    mounted () {
      channel.on('new_msg', payload => {
        this.messages.unshift({
          name: payload.name,
          text: payload.body,
          date: new Date().toLocaleTimeString('en-US', { hour12: false }),
          avatarUrl: `https://api.adorable.io/avatars/40/${payload.name}.png`,
          isSystem: payload.is_system
        })
      })

      this.joinChannel()
    },
    methods: {
      pushMessage () {
        channel.push('new_msg', {
          name: this.name,
          body: this.currentMessage,
          isSystem: false
        })
        this.currentMessage = ''
      },
      joinChannel () {
        channel.join()
          .receive('ok', resp => {
            // Send message about joining the chat
            channel.push('new_msg', {
              name: this.name,
              body: 'joined #random',
              isSystem: true
            })
          })
      }
    },
    components: {
      Message
    }
  }
</script>
