Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  
  namespace :api do
    namespace :v1 do
      post "/login", to:"users#login"
      post "/register", to:"users#register"

      get "users/:id/reservations", to:"users#reservations",as: "reservations"

      post "/reservations/user/:id", to: "reservations#reserve"
      delete "/reservations/user/:id", to: "reservations#checkout"
      resources :motorcycles
    end
  end
end
