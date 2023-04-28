Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  # root "articles#index"
  root to: "users#index"
  resources :users
  resources :categories, only: [:index, :show, :new, :create] 
  resources :transacs, only: [:index, :show, :new, :create] 
end
