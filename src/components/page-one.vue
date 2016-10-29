<template>
  <div id="page_one" class="page_one">
    <h1>Page One</h1>
    <h1>{{ msg }}</h1>
  </div>
</template>

<script type="text/javascript">
export default {
  data () {
    return {
      msg: 'I am page one!'
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h1 {
  color: #42b983;
}
</style>
