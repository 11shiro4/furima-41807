Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :items
  root to:"items#index"

  resources :items do
    get 'purchase', on: :member
  end
end
