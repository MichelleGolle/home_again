Rails.application.routes.draw do
  root "home#index"
  get '/', to:"home#index"

  resources :users, only: ["show"]

  get '/pets/lost', to: 'pets#lost'
  get '/pets/found', to: 'pets#found'


end
