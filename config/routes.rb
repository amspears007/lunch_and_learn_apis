Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      get "recipes", to: "recipes#search"
      get "learning_resources", to: "learning_resources#search"
      post "users", to: "users#create"
      post "sessions", to: "sessions#create"
      post "favorites", to: "favorites#create"
      get "favorites", to: "favorites#index"
      # resources :recipes, only: [:index]
    end
  end
end
