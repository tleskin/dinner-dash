Rails.application.routes.draw do
  namespace :admin do
    resources :items, except: [:destroy]
    resources :categories
  end

  namespace :user do
    resources :orders, only: [:index, :show]
  end

  resource :checkout, only: [:create, :update]

  resources :orders, only: [:create]
  resources :categories, only: [:show]

  get "admin/orders/dashboard", to: "admin/orders#dashboard"
  get "admin/order", to: "admin/orders#show"
  get "checkout/confirmation", to: "checkouts#confirmation"
  post "checkout/increase", to: "checkouts#increase"
  post "checkout/decrease", to: "checkouts#decrease"
  post "checkout/remove", to: "checkouts#remove"
  get "checkout", to: "checkouts#show"
  get 'checkout', to: "checkouts#edit"
  root to: "home#index"
  resources :items, only: [:show, :index]
  resource :user, except: [:update]
  patch "/user", to: "users#update", as: :update_user
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete '/logout', to: 'sessions#destroy'
  get "admin/dashboard", to: "admin/dashboard#show"
  get "/home", to: "home#index"
end
