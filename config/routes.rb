Rails.application.routes.draw do
  get("/search", to: "search#index")

  resources :recommendations
  resources :places do
    resources :favorites, only: [:create]
  end
  
  devise_for :users

  get "profile", to: "users#profile", as: "profile"
  resources :favorites, only: [:index, :destroy]

  root "search#index"
end
