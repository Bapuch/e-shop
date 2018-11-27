class ItemsController < ApplicationController
  # before_action :authenticate_user!

  def index
    @items = Item.all
    @categories = Category.all
  end

  def show
    @item = Item.find(params[:id])
    @random_items = Item.all.sample(3)
  end

  def add_to_cart
    p "in add CART !!!!"
    puts params
    puts " ***************** "
    @item = Item.find(params[:id])
    puts 1
    if current_user.nil?
      puts 2
      redirect_to item_path(params[:id]), alert: "You must log in to add an item to your cart"
    else
      puts 3
      puts current_user.cart
      current_user.cart.items << @item
      puts 4
      puts current_user.cart
      redirect_to item_path(params[:id]), success: 'Item successfully added to cart!'
    end

  end
end
