Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :instruments do
    resources :bookings, only: [:create]
  end
  get "rentals", to: 'dashboard#rentals', as: :rentals
  get "rented", to: 'dashboard#rented', as: :rented
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
