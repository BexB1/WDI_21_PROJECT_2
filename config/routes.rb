Rails.application.routes.draw do

  get 'pledges/index'

  get 'pledges/show'

  get 'pledges/new'

  get 'pledges/edit'

  get 'pledges/create', to: "pledges#create"

  get 'pledges/update', to: "pledges#index"

  get 'pledges/destroy'

  resources :pledges
  get 'categories/show'

  devise_for :users
  root "home#index"

  get "/home", to: "home#index"
  get "/categories", to: "categories#index"
  get "/pledges", to: "pledges#index"
end
