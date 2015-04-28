Rails.application.routes.draw do
  resource :user

  namespace :admin do
    resources :items, except: [:destroy]
  end

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'admin/dashboard', to: 'admin/dashboard#show'
end
