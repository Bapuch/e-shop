class ShopController < ApplicationController
  def cart
    @cart = current_or_guest_user.cart
  end

  def delete_item
    item = current_or_guest_user.cart.items.where(id: params[:id])
    current_or_guest_user.cart.items.delete(item)
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

    respond_to do |f|
      f.html {redirect_to cart_path}
      f.js {@sum: }
    end
  end

end
