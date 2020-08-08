class ChangeColumnToTeam < ActiveRecord::Migration[5.2]
  def up
    change_column :teams, :name, :string, null: false
    change_column :teams, :points_count, :integer, default: 0
    change_column :teams, :likes_count, :integer, default: 0
    change_column :teams, :items_count, :integer, default: 0
  end

  def down
    change_column :teams, :name, :string, null: true
    change_column_default :teams, :points_count, :integer, default: nil
    change_column_default :teams, :likes_count, :integer, default: nil
    change_column_default :teams, :items_count, :integer, default: nil
  end
end
