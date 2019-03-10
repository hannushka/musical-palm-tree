class CreateContests < ActiveRecord::Migration[5.2]
  def change
    create_table :contests do |t|
      t.string :name
			t.boolean :completed

      t.timestamps null: false
    end
  end
end
