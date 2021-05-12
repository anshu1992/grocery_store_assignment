Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :products
  resources :categories
  resources :line_items
  resource :carts, only: [:show]
  resources :coupons do
    post :apply_coupon, on: :collection
    post :remove_coupon, on: :member
  end
  resources :checkouts, only: [:create] do
    get :confirmation, on: :collection
  end
  devise_for :users

  root to: "home#index"
end
