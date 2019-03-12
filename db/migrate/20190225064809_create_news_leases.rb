class CreateNewsLeases < ActiveRecord::Migration[5.2]
  def change
    create_table :news_leases do |t|
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true
      t.references :place, foreign_key: true
      t.references :image, foreign_key: true
      t.integer :price_type
      t.integer :price_value
      t.integer :deposit_price
      t.string :deposit_paper
      t.string :product_name
      t.text :description
      t.integer :sell
      t.string :key_search
      t.string :lease_name
      t.string :lease_phone_number
      t.boolean :status, default: "false"

      t.timestamps
    end
  end
end
