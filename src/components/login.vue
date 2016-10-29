<template>
  <div id="login" class="login">
    <h1>{{ msg }}</h1>
  </div>
</template>

<script type="text/javascript">
export default {
  data () {
    return {
      msg: 'Login Please!'
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
