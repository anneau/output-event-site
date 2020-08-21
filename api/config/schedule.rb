# Rails.rootを使用するために必要
require File.expand_path(File.dirname(__FILE__) + '/environment')
# cronを実行する環境変数
rails_env = ENV['RAILS_ENV'] || :development
# cronを実行する環境変数をセット
set :environment, rails_env
# cronのログの吐き出し場所
set :output, error: 'log/crontab_error.log', standard: 'log/crontab.log'

ENV.each { |k, v| env(k, v) }

# 1分毎に`HelloWorld`を出力する
every 1.minutes do
  begin
    rake "rss:hello"
  rescue => e
    raise e
  end
end
