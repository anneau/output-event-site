namespace :user do
  desc 'userテーブルのデータを更新するタスク'
  task update: :environment do
    Assets::Models::User.update
  end
end
