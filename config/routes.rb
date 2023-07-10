Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "/inventory", to: "pages#inventory"

  resources :yarns
  resources :projects do
    resources :assigned_yarns
  end
end
