Rails.application.routes.draw do
  resources :questions, except: [:show]
  resources :evenements, except: [:show]
  resources :inscriptions
  devise_for :users
  root to: 'pages#home'
end
