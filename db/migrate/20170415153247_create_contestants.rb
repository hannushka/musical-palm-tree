class CreateContestants < ActiveRecord::Migration
  def change
    create_table :contestants do |t|
      t.string :country
      t.string :title

      t.timestamps null: false
    end
  end
end
