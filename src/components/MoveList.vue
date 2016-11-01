<template>
  <div id="move-list">
    <ul class="list-group">
      <li class="list-group-item" v-for="article in articles">
        {{ article.title }}
      </li>
    </ul>
    <button type="button" v-on:click="getDoubanData">GetData</button>
  </div>
</template>

<script>
export default {
  data () {
    return {
      articles: []
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
    getDoubanData: function () {
      this.$http.jsonp('https://api.douban.com/v2/movie/top250?count=10', {}, {
        headers: {
        },
        emulateJSON: true
      }).then((response) => {
        this.articles = response.data.subjects
      }).catch((response) => {
        console.log(response)
      })
    }
  }
}
</script>

<style>
</style>
