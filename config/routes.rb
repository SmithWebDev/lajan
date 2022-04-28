Rails.application.routes.draw do
  get 'user/profile'
  get 'user/accounts'
  get 'user/connections'
  resources :account_holdings
  resources :accounts
  devise_for :users
  resources :company do
    get '/analysis', to: 'analysis#index', as: :analysis
    get '/price_history', to: 'price_history#index', as: :price_history
  end
  get 'trash', to: 'dashboard#trash'
  root 'dashboard#trash'
  # root 'dashboard#index'
  # root 'pages#home'
end
