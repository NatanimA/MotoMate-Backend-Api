Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    namespace :v1 do
      post "/login", to:"users#login"
      post "/register", to:"users#register"
      post "/reserve", to:"reservations#reserve"
      delete "/reserve/:id", to:"reservations#checkout"
    end
  end
end
