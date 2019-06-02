Rails.application.routes.draw do
  resources :questions, except: [:show]
  resources :evenements, except: [:show]
  resources :inscriptions
  devise_for :users
  get 'dashboard', to: 'pages#dashboard'
  root to: 'pages#home'
end
