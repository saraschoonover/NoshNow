Rails.application.routes.draw do
  get("/search", to: "search#index")
  resources :recommendations
  resources :places
  devise_for :users
  get "profile", to: "users#profile", as: "profile"
  
  root "places#home"
end
