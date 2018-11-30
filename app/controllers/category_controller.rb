class CategoryController < ApplicationController
  def index
    @categories = Category
    @items = Item
  end
end
