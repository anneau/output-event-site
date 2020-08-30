require 'net/http'
require 'json'
require 'date'

module Assets::Qiita
  extend self
  def fetch(user_name)
    # 指定したユーザーの投稿一覧を返すQiitaAPIのエンドポイント
    uri = URI.parse("https://qiita.com/api/v2/users/#{user_name}/items")
    res = Net::HTTP.get_response(uri)
    # JSONをパースし投稿一覧を取得
    items = JSON.parse(res.body)

    likes_count = items_count = 0
    event_start_date = Date.parse('2020-09-01')
    event_end_date = Date.parse('2020-09-30')

    items.each do |item|
      created_at = Date.parse(item['created_at'])
      # アウトプット企画実施期間中の記事投稿数とLGTM数をカウントする
      if created_at >= event_start_date && created_at <= event_end_date
        likes_count += item['likes_count'].to_i
        items_count += 1
      end
    end
    { likes_count: likes_count, items_count: items_count }
  end
end
