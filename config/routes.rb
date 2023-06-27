Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "/inventory", to: "pages#inventory"

  resources :yarns
end
