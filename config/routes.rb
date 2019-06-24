Rails.application.routes.draw do
  scope "(:locale)", locale: /fr|ar/ do
    resources :questions, except: [:show, :destroy]
    resources :evenements, except: [:show, :destroy] do
      member do
        get 'activate'
      end
    end
    resources :inscriptions, except: [:destroy, :create]
    get 'dashboard', to: 'pages#dashboard', as: :dashboard
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
end
