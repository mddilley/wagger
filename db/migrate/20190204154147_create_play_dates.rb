class CreatePlayDates < ActiveRecord::Migration[5.2]
  def change
    create_table :play_dates do |t|
      t.string :location
      t.date :date
      t.time :time
      t.integer :dog_limit

      t.timestamps
    end
  end
end
