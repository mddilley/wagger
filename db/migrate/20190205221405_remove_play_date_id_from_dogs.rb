class RemovePlayDateIdFromDogs < ActiveRecord::Migration[5.2]
  def change
    remove_column :dogs, :play_date_id, :integer
  end
end
