Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :shops do
    resources :products, only: [:new, :create, :show]
  end
  resources :product, only: [:update, :edit, :destroy] do
    resources :cart_items, only: [:create]
  end  
  resources :cart_items, only: [:update, :destroy]
  resources :carts, only: [:show, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end