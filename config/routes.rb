Rails.application.routes.draw do
  # get 'sessions/new'

  # get 'sessions/create'
  get '/login' => 'sessions#new'
  post "/login", to: "sessions#create", as: "signin"
  post '/logout' => 'sessions#destroy'
  get '/logout' => 'sessions#destroy'
  get  '/hello' => 'sessions#hello'
  get '/signup' => 'users#new'
  resources :charges
  resources :transactions
  resources :users
  resources :products
  root 'application#index'
  # root 'application#hello'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
