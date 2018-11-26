Rails.application.routes.draw do
  get 'items/index'
  get 'items/show'
  get 'item/index'
  get 'item/show'
  root to: 'home#index'
  devise_for :users
  resources :items, only: [:index, :show]
end
