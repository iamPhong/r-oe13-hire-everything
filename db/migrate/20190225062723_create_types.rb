class CreateTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :types do |t|
      t.text :name
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
