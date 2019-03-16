class AddEndDateToContests < ActiveRecord::Migration[5.2]
  def change
    add_column :contests, :end_date, :string
  end
end
