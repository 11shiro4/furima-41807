Rails.application.routes.draw do
  get 'orders/index'
  get 'orders/create'
  devise_for :users
  resources :users
  resources :items
  root to:"items#index"

  resources :items do
    resources :orders, only: [:create, :index]
  end
end
