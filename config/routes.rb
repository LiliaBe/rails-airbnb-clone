Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :instruments do
    resources :bookings, only: [:create]
  end

  resources :bookings do
    resources :reviews, only: [:create, :new, :show, :index]
  end
  resources :reviews, only: :destroy

  get "rentals", to: 'dashboard#rentals', as: :rentals
  get "rented", to: 'dashboard#rented', as: :rented
  get "profile", to: 'dashboard#profile', as: :profile

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
