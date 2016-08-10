Rails.application.routes.draw do

  resources :pledges
  resources :users

  post 'pledges/:id/checkin', to: "pledges#checkin", as: :checkin_pledge

  resources :pledges
  get 'categories/show'

  devise_for :users
  root "home#index"

  get "/home", to: "home#index"
  get "/user/:id", to: "users#show"
  get "/categories", to: "categories#index"
  get "/pledges", to: "pledges#index"
end
