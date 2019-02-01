class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.boolean :admin
      t.integer :age
      t.string :name
      t.string :city
      t.string :state
      t.string :hobbies

      t.timestamps
    end
  end
end
