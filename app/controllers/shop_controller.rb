class ShopController < ApplicationController
  def cart
    @cart = current_or_guest_user.cart
  end

  def delete_item
    cart_items = current_or_guest_user.cart.items
    item = cart_items.where(id: params[:id])
    cart_items.delete(item)

    @sum = cart_items.sum(:price)
    respond_to do |f|
      f.html {redirect_to cart_path}
      f.js
    end
  end

  def update_quantity

    cart = current_or_guest_user.cart
    item = Item.find(params[:item_id])
    qty = params[:qty].to_i

    if qty > cart.items.where(id: item.id).count

      (qty - cart.items.where(id: item.id).count).times do |i|
        cart.items << item
        cart.save
      end

    elsif qty < cart.items.where(id: item.id).count

      del_item = cart.items.where(id: item.id).first
      cart.items.delete(del_item)
      qty.times do |i|
        cart.items << item
        cart.save
      end
    end
    @sum = cart.items.sum(:price)
    respond_to do |f|
      f.html {redirect_to cart_path}
      f.js
    end
  end

end
