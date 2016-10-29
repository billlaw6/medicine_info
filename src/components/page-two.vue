<template>
  <div id="page_two" class="page_two">
    <h1>{{ msg }}</h1>
  </div>
</template>

<script type="text/javascript">
export default {
  data () {
    return {
      msg: 'I am page two!'
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
