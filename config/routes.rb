Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :products
  resources :categories
  resources :line_items
  resource :carts, only:[:show]
  devise_for :users

  root to: "home#index"
end
