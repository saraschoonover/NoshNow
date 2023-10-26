Rails.application.routes.draw do
  resources :recommendations
  resources :places
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "profile", to: "users#profile", as: "profile"
  
  root "places#index"
end
