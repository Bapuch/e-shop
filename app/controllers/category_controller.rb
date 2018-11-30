class CategoryController < ApplicationController
  def index
    @categories = Category
    @active_cat = 0
    @all_items = Item
    @items = Item
  end

  def update
    @all_items = Item
    @categories = Category
    @active_cat = params[:id]
    @items = (@active_cat == 0) ? Item : Item.where(category_id: @active_cat)

    respond_to do |f|
      f.html {redirect_to items_path}
      f.js
    end
  end
end
