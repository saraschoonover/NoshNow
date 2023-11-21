Rails.application.routes.draw do
  devise_for :users

  resources :favorites
  resources :yelp_places, only: %i[ index show ]
  resources :favorites, only: [:index, :destroy]

  get "profile", to: "users#profile", as: "profile"

  root "yelp_places#index"
end
