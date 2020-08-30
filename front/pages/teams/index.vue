<template>
  <div class="container">
    <h1>ランキング</h1>
    <AppTable :teams="teams" />
  </div>
</template>

<script>
import AppTable from '~/components/organisms/AppTable.vue'

export default {
  components: {
    AppTable,
  },
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
