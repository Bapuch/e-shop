class AddAnonymousToCart < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :anonymous_user, :serial
  end
end
