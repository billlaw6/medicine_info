<template>
  <form id="login">
    <h1>Log In</h1>
    <fieldset id="inputs">
      <input id="username" type="text" placeholder="Username" autofocus required>
      <input id="password" type="password" placeholder="Password" required>
    </fieldset>
    <fieldset id="action">
      <input type="submit" value="Log in">
      <a href="">Forgot your password?</a><a href="">Register</a>
    </fieldset>
  </form>
</template>

<script>
export default {
  data () {
    return {
      msg: 'Login Please!'
    }
  }
}
</script>

<style scoped>
  #login {
    box-shadow: 0 0 2px rgba(0, 0, 0, 0.2),
                0 1px 1px rgba(0, 0, 0, .2),
                0 3px 0 #fff,
                0 4px 0 rgba(0, 0, 0, .2),
                0 6px 0 #fff,  
                0 7px 0 rgba(0, 0, 0, .2);
    position: absolute;
    z-index: 0;
  }
  #login:before {
    content: '';
    position: absolute;
    z-index: -1;
    border: 1px dashed #ccc;
    top: 5px;
    bottom: 5px;
    left: 5px;
    right: 5px;
    box-shadow: 0 0 0 1px #fff;
  }
</style>
