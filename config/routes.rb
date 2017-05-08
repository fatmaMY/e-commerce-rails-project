Rails.application.routes.draw do
  # get 'sessions/new'

  namespace :admin do
    resources :products
    resources :users
    resources :transactions

  end
  get 'admin', to: 'admin#control_panel'

  # get 'sessions/create'
  get '/login' => 'sessions#new'
  post "/login", to: "sessions#create", as: "signin"
  post '/logout' => 'sessions#destroy'
  get '/logout' => 'sessions#destroy'
  get  '/hello' => 'sessions#hello'
  get '/signup' => 'users#new'
  resources :charges
  resources :transactions, only: [:new, :show]
  resources :users, only: [:new, :show, :edit, :create]
  resources :products, only: [:index, :show]
  root 'application#index'
  get 'thanks', to: 'charges#thanks', as: 'thanks'
  # root 'application#hello'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
