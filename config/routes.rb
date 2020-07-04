Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  resources :users, only: %i[show] do
    resources :boats, only: %i[index show new create edit update]
    resources :bookings, only: %i[index show new create edit update]
  end

  resources :boats, only: %i[destroy]
  resources :bookings, only: %i[destroy]

end
