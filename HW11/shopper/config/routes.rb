Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :products
  resources :categories
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'products#index'

  # Defines the cart path route
  get 'cart', to: 'carts#show', as: :cart
  resources :line_items, only: %i[create destroy]
  post 'line_items/:id/increase_quantity', to: 'line_items#increase_quantity', as: 'line_item_increase'
  post 'line_items/:id/decrease_quantity', to: 'line_items#decrease_quantity', as: 'line_item_decrease'
  resources :orders, only: %i[create show]
  patch 'orders/:id/update_status', to: 'orders#update_status', as: 'order_paid'
end
