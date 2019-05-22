class AddLatitudeAndLongitudeToPlayDates < ActiveRecord::Migration[5.2]
  def change
    add_column :play_dates, :latitude, :string
    add_column :play_dates, :longitude, :string
  end
end
