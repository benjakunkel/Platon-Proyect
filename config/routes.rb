Rails.application.routes.draw do
  root to: 'pages#home'
  get '/pages/confirmation', to: 'pages#confirmation', as: "confirmation"
  devise_for :users
  get '/dashboard', to: 'pages#dashboard'
  resources :shops
  resources :products, only: [:update, :edit, :destroy, :new, :create] do
    resources :cart_items, only: [:create]
  end  
  resources :cart_items, only: [:update, :destroy] do
    member do
      patch "increase"
    end
  end
  resources :carts, only: [:show, :update]
  # patch "/increase", 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end