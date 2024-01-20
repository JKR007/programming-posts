# frozen_string_literal: true

Rails.application.routes.draw do
  root 'posts#index'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :posts
  get '/network', to: 'pages#network'
end
