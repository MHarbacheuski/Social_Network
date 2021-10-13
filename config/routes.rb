# frozen_string_literal: true

Rails.application.routes.draw do
  get 'friends/activities', to: 'activities#index', as: 'friends_activities'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'invitations/create'
  get 'invitations/update'
  get 'invitations/destroy'
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations', sessions: 'users/sessions' }
  resources :users
  resources :users_interests
  resources :profiles
  resources :posts do
    resources :comments
    resources :likes
  end
  resources :room_messages
  resources :rooms
  root to: 'users_interests#new'
end
