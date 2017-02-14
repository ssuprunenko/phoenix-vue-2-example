<template>
  <div class="dt w-100 br2 ba b--black-20 mv3 pa2">
    <div class="dtc w2 w3-ns v-mid">
      <img src="https://assets-cdn.github.com/images/modules/logos_page/GitHub-Mark.png" />
    </div>
    <div class="dtc v-mid pl3 repo-link-form">
      <input
        v-if="is_editing"
        v-model.trim="path"
        @keyup.enter="submit"
        type="text"
        class="input-reset bl-0 bt-0 br-0 bb w-80 pa2 outline-transparent"
        v-bind:class="[error ? 'b--dark-red' : 'b--silver']"
        placeholder="/"
      />
      <a v-else :href="url" class="link dim blue" target="_blank">{{url}}</a>
      <div v-show="error" class="f6 dark-red pt1">{{error}}</div>
    </div>
    <div class="dtc v-mid pr2">
      <div v-if="is_editing" class="w-100 tr">
        <!-- Save button -->
        <button
          v-on:click="submit"
          class="f6 button-reset bg-white ba b--green dim pointer pv1 mr1 green"
        >Save</button>

        <!-- Cancel button -->
        <button
          v-on:click="toggleEdit"
          class="f6 button-reset bg-white ba b--black-10 dim pointer pv1 black-60"
        >Cancel</button>
      </div>

      <div v-else class="w-100 tr">
        <!-- Enter to edit mode -->
        <button
          v-on:click="toggleEdit"
          class="f6 button-reset bg-white ba b--black-10 dim pointer pv1 mr1 black-60"
        >Edit</button>

        <!-- Delete a link from the db -->
        <button
          class="f6 button-reset bg-white ba b--dark-red dim pointer pv1 dark-red"
        >Delete</button>
      </div>
    </div>
  </div>
</template>

<script>
  export default {
    data () {
      return {
        is_editing: false,
        path: this.link.path,
        tempPath: this.link.path,
        error: null
      }
    },
    props: ['link'],
    computed: {
      url () {
        return `https://${this.link.host}/${this.path}`
      }
    },
    methods: {
      toggleEdit () {
        this.error = null
        this.is_editing = !this.is_editing
      },

      submit () {
        // Update link
        this.$http.patch(`links/${this.link.id}`, {
          link: { path: this.path }
        }).then((response) => {
          // Success
          this.error = null
          this.toggleEdit()
        }, (response) => {
          // Error
          return response.json()
        }).then((data) => {
          // Show error message
          if (data) {
            this.error = data.errors[0]
            this.path = this.tempPath
          } else {
            this.tempPath = this.path
          }
        })
      }
    }
  }
</script>
