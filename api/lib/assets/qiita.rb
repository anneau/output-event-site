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

    likes_count = 0
    items_count = 0

    # アウトプット企画実施日
    event_date = Date.parse('2020-09-01')

    items.each do |item|
      created_at = Date.parse(item['created_at'])

      # アウトプット企画実施日以降の記事投稿数とLGTM数をカウントする
      if created_at >= event_date
        likes_count += item['likes_count'].to_i
        items_count += 1
      end
    end
    { likes_count: likes_count, items_count: items_count }
  end
end
