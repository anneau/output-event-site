<template>
  <table>
    <thead>
      <tr>
        <th>順位</th>
        <th>チーム名</th>
        <th>ポイント</th>
        <th>LGTM数</th>
        <th>投稿数</th>
      </tr>
    </thead>
    <tbody>
      <tr v-for="(team, index) in teams" :key="team.id">
        <td>{{ rank(index, teams) }}</td>
        <td>{{ team.name }}</td>
        <td>{{ team.points_count }}</td>
        <td>{{ team.items_count }}</td>
        <td>{{ team.likes_count }}</td>
      </tr>
    </tbody>
  </table>
</template>

<script>
export default {
  props: {
    teams: {
      type: Array,
      required: true,
    },
  },
  methods: {
    rank(index, teams) {
      // TODO: もっと綺麗に書ける気がする
      if (index === 0) {
        return 1
      } else if (teams[index].points_count === teams[index - 1].points_count) {
        return index
      } else {
        return index + 1
      }
    },
  },
}
</script>
