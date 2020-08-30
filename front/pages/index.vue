<template>
  <main>
    <div class="container">
      <h1 class="title">
        <img src="@/assets/images/title.png" alt="アウトプット夏祭り2020" />
      </h1>
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
          <tr v-for="(item, index) in rankingList" :key="item.id">
            <th>
              <span class="rank">{{ index + 1 }}</span
              >位
            </th>
            <td>{{ item.name }}</td>
            <td>{{ item.points_count }}pt</td>
            <td>{{ item.likes_count }}LGTM</td>
            <td>{{ item.items_count }}投稿</td>
          </tr>
        </tbody>
      </table>
    </div>
    <div class="bg-container">
      <img class="bg1" src="@/assets/images/bg1.png" />
      <img class="bg2" src="@/assets/images/bg2.png" />
      <img class="bg3" src="@/assets/images/bg3.png" />
    </div>
  </main>
</template>

<script>
export default {
  data() {
    return {
      rankingList: [
        {
          id: 1,
          name: 'TeamA',
          points_count: 100,
          likes_count: 20,
          items_count: 10,
        },
        {
          id: 2,
          name: 'hogehogehoge',
          points_count: 80,
          likes_count: 10,
          items_count: 8,
        },
        {
          id: 2,
          name: 'エイチームブライズ',
          points_count: 80,
          likes_count: 5,
          items_count: 3,
        },
      ],
    }
  },
}
</script>
