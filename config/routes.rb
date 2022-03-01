Rails.application.routes.draw do
  devise_for :users
  resources :company
  root 'dashboard#index'
  # root 'pages#home'
end
