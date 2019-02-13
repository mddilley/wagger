class AddUserIdToPlayDate < ActiveRecord::Migration[5.2]
  def change
    add_column :play_dates, :user_id, :integer
  end
end
