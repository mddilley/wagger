class AddNameToPlayDates < ActiveRecord::Migration[5.2]
  def change
    add_column :play_dates, :name, :string
  end
end
