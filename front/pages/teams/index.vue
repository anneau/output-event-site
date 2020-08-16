<template>
  <div class="container">
    <h1>ランキング</h1>
    <ul v-for="team in teams" :key="team.id">
      <li>
        チーム名：{{ team.name }}<br />
        現在のポイント：{{ team.points_count }}<br />
        総投稿数：{{ team.items_count }}<br />
        LGTM数：{{ team.likes_count }}<br />
      </li>
    </ul>
  </div>
</template>
<script>
export default {
  async asyncData({ $axios, error }) {
    try {
      const teams = await $axios.$get('http://api:3000/api/v1/teams')
      return { teams }
    } catch (e) {
      error({
        statusCode: e.response.status,
        message: e.response.data.message,
      })
    }
  },
}
</script>
