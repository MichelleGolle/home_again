Rails.application.routes.draw do
  root "home#index"
  get '/', to:"home#index"

  get '/pets/lost', to: 'pets#lost'
  get '/pets/found', to: 'pets#found'


end
