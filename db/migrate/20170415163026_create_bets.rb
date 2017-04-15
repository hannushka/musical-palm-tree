class CreateBets < ActiveRecord::Migration
  def change
    create_table :bets do |t|
			t.string :name
      t.references :user, index: true, foreign_key: true
      t.references :contest, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
