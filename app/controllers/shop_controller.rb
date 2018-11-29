class ShopController < ApplicationController
  before_action :authenticate_user!

  def cart
    @cart = current_user.cart
    @all_carts = Cart
  end

  def delete_item
    item = current_user.cart.items.where(id: params[:id])
    current_user.cart.items.delete(item)
  end

  def order_confirmation
    if @order.
  end 
end
