<template>
  <div>
    <div class='form-group'>
      <input
        v-model='currentMessage'
        @keyup.enter='pushMessage'
        type='text'
        class='form-control'
        placeholder='Message #random'
      />
    </div>

    <div>
      <div class='media' v-for='msg in messages'>
        <div class="media-left">
          <a href="#">
            <img :src="msg.avatarUrl" class="avatar">
          </a>
        </div>
        <div class="media-body">
          <h5 class='media-heading'>
            {{msg.name}}
            <small>{{msg.date}}</small>
          </h5>
          {{msg.text}}
        </div>
      </div>
    </div>
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
          avatarUrl: `https://api.adorable.io/avatars/40/${payload.name}.png`
        })
      })
    },
    methods: {
      pushMessage () {
        channel.push('new_msg', {
          name: this.name,
          body: this.currentMessage
        })
        this.currentMessage = ''
      }
    }
  }
</script>

<style>
  .avatar {
    width: 40px;
    height: 40px;
    border-radius: 10%;
  }
</style>
