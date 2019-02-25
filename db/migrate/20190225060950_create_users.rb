class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :birthday
      t.string :address
      t.string :phone_number
      t.string :facebook
      t.string :website
      t.string :avatar

      t.timestamps
    end
  end
end
