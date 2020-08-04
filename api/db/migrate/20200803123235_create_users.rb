class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :points_count
      t.integer :likes_count
      t.integer :items_count

      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
