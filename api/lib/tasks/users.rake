namespace :users do
  desc 'userテーブルのデータを更新するタスク'
  task update: :environment do
    Assets::Models::Users.update
  end
end
