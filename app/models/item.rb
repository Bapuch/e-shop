class Item < ApplicationRecord
  validates :title, presence: true
  has_many_and_belong_to_many :carts
  has_many_and_belong_to_many :orders
  has_many :users, through :carts
  has_many :users, through :orders
end
