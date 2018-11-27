class ItemsController < ApplicationController
  def index
    @items = Item.all
    @categories = Category.all
  end

  def show
    @item = Item.find(params[:id])
    @random_items = Item.all.sample(3)
  end
end
