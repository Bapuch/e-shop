class ShopController < ApplicationController
  # before_action :authenticate_user!

  def cart
    @cart = current_or_guest_user.cart
    @all_carts = Cart
  end

  def order
  end

  def delete_item
    item = current_or_guest_user.cart.items.where(id: params[:id])
    current_or_guest_user.cart.items.delete(item)
  end
end
