class ShopController < ApplicationController
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

  def place_order
    puts "PLACE ORDER"
    # first create an order
    @cart = Cart.find(params[:id])
    order = current_user.orders.new
    @cart.items.each do |item|
      order.
    end
    # then empty the cart
    
  end
end
