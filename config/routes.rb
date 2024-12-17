Rails.application.routes.draw do
  resources :users
  resources :items
  root to:"items#index"
end
