<template lang="jade">
form(id="login" role="form")
  h1 {{ msg }}
  fieldset(id="inputs")
    input(id="username" type="text" placeholder="Username" autofocus required)
    input(id="password" type="password" placeholder="Password" required)
  fieldset(id="action")
    button(v-on:click="login") Log in
    a(href="") Forgot your password?
    a(href="") Register
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
