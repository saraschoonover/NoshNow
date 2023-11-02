Rails.application.routes.draw do
  get("/search", to: "search#index")

  resources :recommendations
  resources :places
  resources :places do
    member do
      post 'favorite', to: 'places#favorite'
      delete 'unfavorite', to: 'places#unfavorite'
    end
  end
  devise_for :users

  get "profile", to: "users#profile", as: "profile"
  get 'favorite_places', to: 'places#favorite_places'


  
  root "places#home"
end
