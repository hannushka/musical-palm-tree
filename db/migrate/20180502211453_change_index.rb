class ChangeIndex < ActiveRecord::Migration[5.2]
  def change
    remove_index :bets, :name
    add_index :bets, [:name, :contest_id], unique: true
  end
end
