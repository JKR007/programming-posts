# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  # Defines the root path route ("/")
  root 'posts#index'
  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  authenticate :user do
    mount Sidekiq::Web => '/sidekiq'
  end

  resources :posts

  get '/network', to: 'pages#network'
  get '/my_network', to: 'pages#my_network'
  get '/my_posts', to: 'pages#my_posts'
end
