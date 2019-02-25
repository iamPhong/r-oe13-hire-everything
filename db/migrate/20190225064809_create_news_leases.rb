class CreateNewsLeases < ActiveRecord::Migration[5.2]
  def change
    create_table :news_leases do |t|
      t.references :type, foreign_key: true
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true
      t.integer :format_cost
      t.integer :deposit_cost
      t.text :deposit_identify
      t.string :product_name
      t.string :address
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
