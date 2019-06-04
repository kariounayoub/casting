Rails.application.routes.draw do
  resources :questions, except: [:show]
  resources :evenements, except: [:show] do
    member do
      get 'activate'
    end
  end
  resources :inscriptions
  devise_for :users
  get 'dashboard', to: 'pages#dashboard'
  get 'contact', to: 'pages#contact'
  get 'a_propos', to: 'pages#a_propos'
  root to: 'pages#home'
end
