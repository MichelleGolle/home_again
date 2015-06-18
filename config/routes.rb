Rails.application.routes.draw do
  root "home#index"
  get '/', to:"home#index"

  get '/tweets/lost', to: 'tweets#lost'
  get '/tweets/found', to: 'tweets#found'


end
