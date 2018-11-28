Rails.application.routes.draw do

  get 'cart', to: 'shop#cart'
  get 'shop/order'
  get 'product', to: 'product#show'
  get 'category', to: 'category#index'
  root to: 'items#index'
  devise_for :users,
              :controllers => { :registrations => "devise/my_devise/registrations"}
  resources :items, only: [:index, :show]
  resources :charges, only: [:new, :create]
  get 'add_to_cart', to: 'items#add_to_cart'
  put 'delete_item', to: "shop#delete_item"
end
