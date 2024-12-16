Rails.application.routes.draw do
  devise_for :users
  resources :items
  resources :users, only: :show

  root to:"items#index"
end
