Rails.application.routes.draw do
  root "home#index"
  get '/', to:"home#index"

  get '/pets/lost', to: 'tweets#lost'
  get '/pets/found', to: 'tweets#found'


end
