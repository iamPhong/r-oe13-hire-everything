class AddViewsToNewsLeases < ActiveRecord::Migration[5.2]
  def change
    add_column :news_leases, :views, :integer, default: 0
  end
end
