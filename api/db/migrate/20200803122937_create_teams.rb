class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :points_count
      t.integer :likes_count
      t.integer :items_count
      t.integer :rank

      t.timestamps
    end
  end
end
