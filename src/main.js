// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import VueRouter from 'vue-router'
import VueResource from 'vue-resource'

// 开启debug模式
Vue.config.debug = true

Vue.use(VueRouter)
Vue.use(VueResource)

import PageOne from './components/page-one.vue'
import PageTwo from './components/page-two.vue'

//
const router = new VueRouter({
  mode: 'history',
  base: __dirname,
  routes: [
    {
      path: '/first',
      component: PageOne
    },
    {
      path: '/second',
      component: PageTwo
    }
  ]
})

/* eslint-disable no-new
new Vue({
  el: '#app',
  render: h => h(App)
})
*/

new Vue({
  router: router,
  render: h => h(App)
}).$mount('#app')
