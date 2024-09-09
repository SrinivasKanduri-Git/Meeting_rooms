# frozen_string_literal: true

Rails.application.routes.draw do
  resources :meetings
  resources :users, except: [:index]
  post '/login', to: 'authentication#jwt_login'
end
