class ShopController < ApplicationController
  def cart
    @cart = current_or_guest_user.cart
    @all_carts = Cart
  end

  def delete_item
    item = current_or_guest_user.cart.items.where(id: params[:id])
    current_or_guest_user.cart.items.delete(item)
  end

  def place_order
    puts "IN ORDER"
  end

  def create_order
    # first create an order
      if user_signed_in?
      @cart = Cart.find(params[:id])

      @order_id = current_user.id + Time.now.to_i + rand(1000)
      @date = Time.now
      # @address = current_user.address
      # current_user.orders.create!(user_id: current_user.id, order_id: @order_id, date: @date, label: "address", title: "shipped to", description: @address)
      current_user.orders.create!(user_id: current_user.id, order_id: @order_id, date: @date, label: "shipping_fee", title: "total shipping fees", total_price: 150.0)

      @cart.items.distinct.each do |item|
        add_order_item item.title, item.description, item.price, @cart.items.where(id: item.id).count, item.image_url
      end

      # then empty the cart
      @cart.items.destroy_all

      # redirect to the cart view which should be empty now
      redirect_to cart_path
    end
  end

  def add_order_item(title, des, price, quantity, url)
    item = current_user.orders.new(user_id: current_user.id, order_id: @order_id, date: @date, label: "item", title: title, description: des, unit_price: price, quantity: quantity, image_url: url)

    # calculate and save total price for each item
    item.total_price = item.quantity * item.unit_price
    item.save!
  end
end
