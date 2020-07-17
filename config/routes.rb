Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
  get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root to: 'pages#home'

  # resources :users, only: %i[show profile update]
  resources :profiles, only: %i[update show edit] do
    collection do
      get :my_boats
      get :my_requests
    end
  end

  # post '/boats/search', to: 'boats#index', as: :boats_search

  resources :boats do
      resources :bookings, only: %i[new create show edit update]
      resources :reviews, only: %i[new create]
  end

  resources :bookings, only: :index

  resources :conversations do
    resources :messages
  end
end
