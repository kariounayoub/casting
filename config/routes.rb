Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  require "sidekiq/web"
  authenticate :user, lambda { |u| u.admin } do
    mount Sidekiq::Web => '/sidekiq'
  end

  scope "(:locale)", locale: /fr|ar/ do
    resources :questions, except: [:show, :destroy]
    resources :evenements, except: [:show, :destroy] do
      member do
        get 'activate'
      end
    end
    resources :inscriptions, except: [:destroy, :create]
    get 'dashboard', to: 'pages#dashboard', as: :dashboard
    get 'casting', to: 'pages#casting', as: :casting
    get 'contact', to: 'pages#contact'
    get 'a_propos', to: 'pages#a_propos'
    get '/change/:lang', to: 'pages#lang', as: 'lang'
    root to: 'pages#home'
  end
  devise_for :users
  resources :questions, only: [:destroy]
  resources :evenements, only: [:destroy]
  resources :inscriptions, only: [:destroy, :create] do
    resources :notes, only: [:create, :update]
  end
  resources :convocations, only: [:create]
  patch 'convocations/:id/present', to: 'convocations#present'
  post 'convocations/:convocation_id/notes', to: 'notes#create_convocation'
  patch 'convocations/:convocation_id/notes/:id', to: 'notes#update_convocation'
end
