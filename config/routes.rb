Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users
  resources :items, only: [:index, :show]
end
