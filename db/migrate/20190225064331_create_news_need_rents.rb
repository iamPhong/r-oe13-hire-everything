class CreateNewsNeedRents < ActiveRecord::Migration[5.2]
  def change
    create_table :news_need_rents do |t|
      t.references :type, foreign_key: true
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true
      t.string :product_name
      t.text :description
      t.string :picture
      t.string :address
      t.string :phone_number
      t.boolean :status, default: "false"

      t.timestamps
    end
  end
end
