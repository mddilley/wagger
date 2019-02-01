class CreateDogs < ActiveRecord::Migration[5.2]
  def change
    create_table :dogs do |t|
      t.string :name
      t.integer :age
      t.string :breed
      t.integer :weight
      t.boolean :fixed
      t.string :sex
      t.integer :friendly_rating
      t.integer :aggressive_rating

      t.timestamps
    end
  end
end
