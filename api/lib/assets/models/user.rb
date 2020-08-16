module Assets::Models::User
  extend self

  def update
    # DBからnameカラムの値が入った配列を取得
    user_names = User.pluck(:name)

    # DBに保存されている全てのユーザの記事投稿数、LGTM数、ポイントを更新する
    user_names.each do |name|
      @user = User.find_by(name: name)
      # 更新するパラメーターがハッシュで入る
      user_params = Assets::Qiita.fetch(name)
      # 得点の計算
      points_count = user_params[:items_count] * 10 + user_params[:likes_count]

      @user.update!(likes_count: user_params[:likes_count], items_count: user_params[:items_count], points_count: points_count)
    end
  end
end
