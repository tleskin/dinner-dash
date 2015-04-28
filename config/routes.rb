Rails.application.routes.draw do

  resource :user, except: [:update]
  resource :admin
  patch '/user', to: 'users#update', as: :update_user
  get 'login', to: 'sessions#new'

  post 'login', to: 'sessions#create'


end
