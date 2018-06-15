Rails.application.routes.draw do
  get '/dashboard', to: 'dashboards#show', as: 'dashboard'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :drones do
    resources :bookings, only: [ :new, :show, :create, :destroy ]
  end

  resources :drones, only: [ :index, :show ] do
    resources :reviews, only: [ :create ]
  end

end

