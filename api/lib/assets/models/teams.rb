module Assets::Models::Teams
  extend self
  # DBに保存されている全てのteamの記事投稿数、LGTM数、ポイントを更新
  def update
    Team.all.each do |team|
      # 1つのteamに属するユーザーの記事投稿数、LGTM数、ポイントそれぞれの合計値を格納する変数の初期化
      users_items_count_sum = users_likes_count_sum = users_points_count_sum = 0

      # teamに紐づいている全てのuserの記事投稿数、LGTM数、ポイントを合算
      team.users.each do |user|
        users_items_count_sum += user.items_count
        users_likes_count_sum += user.likes_count
        users_points_count_sum += user.points_count
      end
      # チーム人数が4人の場合、得点を3/4倍する(小数点以下は切り捨て)
      users_points_count_sum = (users_points_count_sum * 1.75).floor if team.users.size == 4
      # 合算した記事投稿数、LGTM数、ポイントでDB更新
      team.update!(items_count: users_items_count_sum, likes_count: users_likes_count_sum, points_count: users_points_count_sum)
    end
    puts 'teams was successfully updated!'
  end
end
