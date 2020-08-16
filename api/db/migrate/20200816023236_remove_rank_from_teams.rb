class RemoveRankFromTeams < ActiveRecord::Migration[5.2]
  def up
    remove_column :teams, :rank
  end

  def down
    add_column :teams, :rank
  end
end
