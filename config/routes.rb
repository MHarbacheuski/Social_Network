# frozen_string_literal: true

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'static_pages/home'
  get 'static_pages/help'
  get 'static_pages/about'

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks', registrations: "registrations" }

  resources :users
  resources :users_interests
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "users_interests#new"
end
