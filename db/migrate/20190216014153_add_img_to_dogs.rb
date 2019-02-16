class AddImgToDogs < ActiveRecord::Migration[5.2]
  def change
    add_column :dogs, :img, :string
  end
end
