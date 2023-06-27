Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "/inventory", to: "pages#inventory"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
