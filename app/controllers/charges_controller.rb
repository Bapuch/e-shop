class ChargesController < ApplicationController
  before_action :authenticate_user!

  def new
    @cart = current_user.cart
  end

  def create
    # Amount in cents
    @amount = 500

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

    flash[:success]
    place_order
    #envoie mail order user UserMailer...
    UserMailer.order_confirmation(current_user).deliver_now

    flash[:success] = "Your order has been registered. Thanks!"
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  def place_order
    # first create an order
    if user_signed_in?
      @cart = current_user.cart

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

    end
  end

  def add_order_item(title, des, price, quantity, url)
    item = current_user.orders.new(user_id: current_user.id, order_id: @order_id, date: @date, label: "item", title: title, description: des, unit_price: price, quantity: quantity, image_url: url)

    # calculate and save total price for each item
    item.total_price = item.quantity * item.unit_price
    item.save!
  end

#Send email to admin if params admins  
 ##  @user = current_user
   # if @user.(params[:admin]) == true
    #    @order = current_user.order
     #   UserMailer.order_confirmation.deliver_now
    #end 
 # end cu
  

end