Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :instruments do
    resources :bookings, only: [:create]
  end
  resources :bookings do
    resources :reviews, only: [:create, :new]
  end
  resources :reviews, only: :destroy
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
