Rails.application.routes.draw do
  # Defines the root path route ("/")
  root "static_pages#home"

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", :as => :rails_health_check

  # root "posts#index"

  # Static pages
  get "about", to: "static_pages#about"
  get "contact", to: "static_pages#contact"
end
