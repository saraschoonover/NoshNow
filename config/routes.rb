Rails.application.routes.draw do
  get("/search", to: "search#index")

  resources :recommendations
  resources :places do
    resources :favorites, only: [:create, :destroy]
  end
  
  devise_for :users

  get "profile", to: "users#profile", as: "profile"
  resources :favorites, only: [:index, :create, :destroy]


  
  root "places#home"
end
