namespace :teams do
  desc 'teamテーブルのデータを更新するタスク'
  task update: :environment do
    Assets::Models::Team.update
  end
end
