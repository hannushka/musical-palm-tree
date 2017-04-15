class CreateContestants < ActiveRecord::Migration
  def change
    create_table :contestants do |t|
      t.integer :start_nbr
      t.integer :position
      t.string :country
      t.string :title
      t.references :contest, index: true, foreign_key: true

      t.timestamps null: false
    end
		add_index :contestants, [:contest_id, :created_at]
  end
end
