Rails.application.routes.draw do
  resources :favorites
  get("/search", to: "search#index")

  get 'search/:id', to: 'search#show', as: 'search_show'
  devise_for :users

  get "profile", to: "users#profile", as: "profile"
  resources :favorites, only: [:index, :destroy]

  root "search#index"
end
