class AddPlayDateIdToDogs < ActiveRecord::Migration[5.2]
  def change
    add_column :dogs, :play_date_id, :integer
  end
end
