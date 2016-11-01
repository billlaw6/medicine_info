<template>
  <div class="page-two">
    <h1>{{ msg }}</h1>
  </div>
</template>

<script>
export default {
  data () {
    return {
      msg: 'Page two!'
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this comptwont only -->
<style scoped>
h1 {
  color: #42b983;
}
</style>
