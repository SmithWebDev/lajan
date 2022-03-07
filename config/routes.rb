Rails.application.routes.draw do
  devise_for :users
  resources :company do
    get '/analysis', to: 'analysis#show', as: :analysis
  end
  root 'dashboard#index'
  # root 'pages#home'
end
