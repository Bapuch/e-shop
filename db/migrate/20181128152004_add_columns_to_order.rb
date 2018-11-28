class AddColumnsToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :label, :string
    add_column :orders, :date, :date
    add_column :orders, :title, :string
    add_column :orders, :description, :text
    add_column :orders, :unit_price, :decimal
    add_column :orders, :total_price, :decimal
    add_column :orders, :image_url, :string
    add_column :orders, :quantity, :integer
  end
end
