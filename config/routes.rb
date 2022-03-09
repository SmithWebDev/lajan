Rails.application.routes.draw do
  resources :accounts
  devise_for :users
  resources :company do
    get '/analysis', to: 'analysis#show', as: :analysis
  end
  get 'trash', to: 'dashboard#trash'
  root 'dashboard#index'
  # root 'pages#home'
end
