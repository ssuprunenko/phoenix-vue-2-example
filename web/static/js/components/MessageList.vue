<template>
  <section>
    <div>
      <input
        v-model="currentMessage"
        @keyup.enter="pushMessage"
        type="text"
        class="f6 f5-l input-reset ba black-80 b--black-10 bw1 pa3-l pa2 w-100 br3"
        placeholder="Message #random"
      />
    </div>

    <div class="mt3">
      <message v-for="msg in messages" :msg="msg"></message>
    </div>
  </section>
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
      socket.connect()
      channel.on('new_msg', payload => {
        this.messages.unshift({
          name: payload.name,
          text: payload.body,
          date: new Date().toLocaleTimeString('en-US', { hour12: false }),
          avatarUrl: `https://api.adorable.io/avatars/48/${payload.name}.png`,
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
