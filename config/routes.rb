Rails.application.routes.draw do
  devise_for :users
  root to: 'boats#index'
  resources :users, only: %i[show edit update destroy] do
    resources :boats, only: %i[index show new create edit update]
    resources :bookings, only: %i[index show new create edit update]
  end
  resources :boats, only: %i[destroy]
  resources :bookings, only: %i[destroy]
end
