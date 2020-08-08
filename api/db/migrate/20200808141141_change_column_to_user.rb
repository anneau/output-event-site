class ChangeColumnToUser < ActiveRecord::Migration[5.2]
  def up
    change_column :users, :name, :string, null: false
    change_column :users, :points_count, :integer, default: 0
    change_column :users, :likes_count, :integer, default: 0
    change_column :users, :items_count, :integer, default: 0
  end

  def down
    change_column :users, :name, :string, null: true
    change_column_default :users, :points_count, :integer, default: nil
    change_column_default :users, :likes_count, :integer, default: nil
    change_column_default :users, :items_count, :integer, default: nil
  end
end
