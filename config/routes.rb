Rails.application.routes.draw do

  get 'users/show'
  get 'cart', to: 'shop#cart'
  get 'placeorder', to: 'shop#placeorder'
  get 'product', to: 'product#show'
  get 'category', to: 'category#index'
  root to: 'items#index'
  devise_for :users,
                :controllers => { :registrations => "registrations"}
  resources :items, only: [:index, :show]
  resources :charges, only: [:new, :create]
  get 'add_to_cart', to: 'items#add_to_cart'
  put 'delete_item', to: "shop#delete_item"
  put 'update_quantity', to: "shop#update_quantity"
  put 'place_order', to: "shop#place_order"

end
