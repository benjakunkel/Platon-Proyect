Rails.application.routes.draw do
  get 'shops/new'
  get 'shops/create'
  get 'shops/index'
  get 'shops/show'
  get 'shops/edit'
  get 'shops/update'
  get 'shops/destroy'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
