Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  # resources :users, only: %i[show profile update]
  resources :profiles, only: %i[index update show edit] do
    collection do
      get :my_boats
    end
  end

  resources :boats do
    resources :bookings, only: %i[new create]
  end

  resources :bookings, only: %i[index show edit update]
end
