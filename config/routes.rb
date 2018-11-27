Rails.application.routes.draw do

  get 'cart', to: 'shop#cart'
  get 'shop/order'
  get 'product', to: 'product#show'
  get 'category', to: 'category#index'
  root to: 'items#index'
  devise_for :users
  resources :items, only: [:index, :show]

  get 'add_to_cart', to: 'items#add_to_cart'
end
