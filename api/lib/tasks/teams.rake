namespace :teams do
  desc 'teamテーブルのデータを更新するタスク'
  task update: :environment do
    Assets::Models::Teams.update
  end
end
