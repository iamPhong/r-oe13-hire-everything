class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :main_photo
      t.string :sub_photo

      t.timestamps
    end
  end
end
