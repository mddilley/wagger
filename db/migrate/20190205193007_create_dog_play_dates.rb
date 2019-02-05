class CreateDogPlayDates < ActiveRecord::Migration[5.2]
  def change
    create_table :dog_play_dates do |t|
      t.integer :dog_id
      t.integer :play_date_id
      t.string :note
    end
  end
end
