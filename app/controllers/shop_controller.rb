class ShopController < ApplicationController
  before_action :authenticate_user!

  def cart
    @cart = current_user.cart
    @all_carts = Cart
  end

  def order
    @order = Order.find(params[:id])
    if @order.users.include? current_user
      flash[:success] = "Vous allez passer au paiement"
      redirect_to @order
    end 
    @amount = @order.price
    
      customer = Stripe::Customer.create(
        :email => params[:stripeEmail],
        :source  => params[:stripeToken]
      )
    
      charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => @amount,
        :description => "Paiement de #{@user.name}",
        :currency    => 'eur'
      )
    @order.users << current_user
    flash[:success] = "Merci pour le paiement"
    redirect_to @order

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
    end  
  end

  def delete_item
    item = current_user.cart.items.where(id: params[:id])
    current_user.cart.items.delete(item)
  end
end
