class CreatePlacements < ActiveRecord::Migration[5.2]
  def change
    create_table :placements do |t|
      t.integer :position
      t.references :bet, index: true, foreign_key: true
      t.references :contestant, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
