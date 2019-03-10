class AddIndex < ActiveRecord::Migration[5.0]
  def change
		add_index :placements, [:bet_id, :contestant_id], unique: true
		add_index :bets, :name, unique: true
  end
end
