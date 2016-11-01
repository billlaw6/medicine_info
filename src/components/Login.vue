<template>
  <form id="login" role="form">
    <h1>{{ msg }}</h1>
    <div class="form-group">
      <label for="username">UserName</label>
      <input id="username" type="text" class="form-control" placeholder="Username" autofocus required>
    </div>
    <div class="form-group">
      <label for="password">Password</label>
      <input id="password" type="password" class="form-control" placeholder="Password" required>
    </div>
    <div class="checkbox">
      <label>
        <input type="checkbox">请打勾
      </label>
    </div>
    <button type="submit" class="btn btn-default" v-on:click="login">Log in</button>
    <a href="">Forgot your password?</a><a href="">Register</a>
  </form>
</template>

<script>
export default {
  data () {
    return {
      msg: 'Login Please!'
    }
  },
  methods: {
    register: function () {
      this.$http.post(this.registerUrl, this.registerModel)
        .then((response) => {
          this.msg = '注册成功！'
        }).catch((response) => {
          this.msg = response.json()
        })
    },
    login: function () {
      console.log('login')
      this.msg = 'Logging...'
      this.$http.post(this.loginUrl, this.loginModel)
        .then((response) => {
          var body = response.json()
          this.msg = '登录成功！'
          this.userName = body.userName

          window.sessionStorage.setItem('accessToken', body.access_token)
          window.sessionStorage.setItem('userName', body.userName)
        }).catch(this.requestError)
    },
    logout: function () {
      this.$http.post(this.logoutUrl)
        .then((response) => {
          this.msg = '注销成功！'
          this.userName = ''
          this.loginModel.username = ''
          this.loginModel.password = ''

          window.sessionStorage.removeItem('userName')
          window.sessionStorage.removeItem('accessToken')
        }).catch(this.requestError)
    },
    callApi: function () {
      var headers = {}
      headers.Authorization = 'Bearer' + window.sessionStorage.getItem('accessToken')
      this.$http.get(this.apiUrl, {
        headers: headers
      })
      .then((response) => {
        this.result = response.json()
      }).catch(this.requestError)
    }
  }
}
</script>

<style scoped>
</style>
