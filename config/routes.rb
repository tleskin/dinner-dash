Rails.application.routes.draw do
  root to: "home#index"

  namespace :admin do
    resources :items, except: [:destroy]
    resources :categories
  end

  resource :checkout, only: [:create, :update]

  resources :orders, only: [:create]
  resources :categories, only: [:show, :index]

  get "admin/orders/dashboard", to: "admin/orders#dashboard"
  get "admin/order", to: "admin/orders#show"
  post "admin/order/update", to: "admin/orders#update"
  get "checkout/confirmation", to: "checkouts#confirmation"
  post "checkout/increase", to: "checkouts#increase"
  post "checkout/decrease", to: "checkouts#decrease"
  post "checkout/remove", to: "checkouts#remove"
  get "checkout", to: "checkouts#show"
  get 'checkout', to: "checkouts#edit"
  resources :items, only: [:show, :index]
  resource :user, except: [:update]
  patch "/user", to: "users#update", as: :update_user
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete '/logout', to: 'sessions#destroy'
  get "admin/dashboard", to: "admin/dashboard#show"
  get "/home", to: "home#index"
end
