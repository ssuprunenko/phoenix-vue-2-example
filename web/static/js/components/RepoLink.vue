<template>
  <div class="dt w-100 br2 ba b--black-20 mv3 pa2">
    <div class="dtc w2 w3-ns v-mid">
      <img src="https://assets-cdn.github.com/images/modules/logos_page/GitHub-Mark.png" />
    </div>
    <div class="dtc v-mid pl3">
      <a :href="url" class="link dim blue" target="_blank">{{url}}</a>
    </div>
    <div class="dtc v-mid">
      <form class="w-100 tr">
        <button class="f6 button-reset bg-white ba b--black-10 dim pointer pv1 mr1 black-60" type="submit">+ Edit</button>
        <button class="f6 button-reset bg-white ba b--black-10 dim pointer pv1 black-60" type="submit">&times; Delete</button>
      </form>
    </div>
  </div>
</template>

<script>
  export default {
    props: ['link'],
    computed: {
      url () {
        return `https://${this.link.host}/${this.link.path}`
      }
    }
  }
</script>
