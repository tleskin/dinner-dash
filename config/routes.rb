Rails.application.routes.draw do
  namespace :admin do
    resources :items, except: [:destroy]
    resources :categories
  end

  resources :items, only: [:show, :index]
  resource :user, except: [:update]
  patch "/user", to: "users#update", as: :update_user
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  get "admin/dashboard", to: "admin/dashboard#show"
end
