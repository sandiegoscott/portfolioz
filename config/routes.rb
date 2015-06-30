Rails.application.routes.draw do

  resources :trades

  root to: 'visitors#index'

  devise_for :users
  resources :users

  resources :transactions

end
