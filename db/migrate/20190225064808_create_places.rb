class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.string :lat
      t.string :lng
      t.string :address

      t.timestamps
    end
  end
end
