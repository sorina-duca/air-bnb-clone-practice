Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
  get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root to: 'pages#home'

  # resources :users, only: %i[show profile update]
  resources :profiles, only: %i[index update show edit] do
    collection do
      get :my_boats
    end
  end

  resources :boats do
    resources :bookings, only: %i[index new create show]
  end

  resources :bookings, only: %i[index show edit update]
end
