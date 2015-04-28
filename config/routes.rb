Rails.application.routes.draw do
  resource :user
  resource :admin
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
end
