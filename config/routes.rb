Rails.application.routes.draw do
  
  resources :bookmarks, only: [:index, :show, :create, :update, :destroy]
  resources :restaurants, only: [:index, :show, :create, :update, :destroy]
  resources :users, only: []
  post "/signup", to: "users#create"
  get "/me", to: "users#show"

  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  
  # namespace :api do
  #   namespace :v1 do
      get '/yelp', to: 'yelp#fetch'
      post '/search', to: 'yelp#search'
      post '/restaurantsDetail', to: 'yelp#restaurantsDetail'
      get '/location', to: 'location#fetch'
      post '/city', to: 'location#city'

  #   end
  # end
  # Routing logic: fallback requests for React Router.
  # Leave this here to help deploy your app later!
  get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }
end
