# Rails.rootを使用するために必要
require File.expand_path(File.dirname(__FILE__) + '/environment')
# cronを実行する環境変数
rails_env = ENV['RAILS_ENV'] || :development
# cronを実行する環境変数をセット
set :environment, rails_env
# cronのログの吐き出し場所
set :output, error: 'log/crontab_error.log', standard: 'log/crontab.log'

ENV.each { |k, v| env(k, v) }

# 1分毎に`HelloWorld`を出力する(テスト用)
every 1.minutes do
  rake 'rss:hello'
rescue StandardError => e
  raise e
end
# 1時間ごとに全てのuserとteamのデータを更新する
every 1.hours do
  rake 'users:update'
  rake 'teams:update'
rescue StandardError => e
  raise e
end
