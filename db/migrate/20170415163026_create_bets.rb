class CreateBets < ActiveRecord::Migration[5.2]
  def change
    create_table :bets do |t|
			t.string :name
      t.references :contest, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
