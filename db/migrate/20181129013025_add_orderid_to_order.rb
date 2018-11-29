class AddOrderidToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :order_id, :string
  end
end
