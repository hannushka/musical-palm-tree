class CreateSettings < ActiveRecord::Migration[5.1]
  def change
    create_table :settings do |t|
      t.integer :nbr_contestants

      t.timestamps
    end
  end
end
