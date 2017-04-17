class AddIndex < ActiveRecord::Migration
  def change
		add_index :placements, [:bet_id, :contestant_id], unique: true
  end
end
