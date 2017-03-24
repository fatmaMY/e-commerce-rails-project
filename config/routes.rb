Rails.application.routes.draw do
  resources :transactions
  resources :users
  resources :products
  root 'application#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end