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
    puts "how is HERE ??"
    puts "TEST rESULT : #{current_or_guest_user}"
    puts "current ******** : #{current_user}"
    puts "guest ******** : #{guest_user}"
    puts "****************"
    @item = Item.find(params[:id])

    current_or_guest_user.cart.items << @item
    flash[:success] = 'Item successfully added to cart!'
    redirect_to item_path(params[:id])


  end
end
