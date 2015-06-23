Rails.application.routes.draw do
  root "home#index"
  get '/', to:"home#index"

  get '/tweets/lost', to: 'tweets#lost'
  get '/tweets/found', to: 'tweets#found'
  get '/tweets/lost_ajax', to: 'tweets#lost_ajax'
  get '/tweets/found_ajax', to: 'tweets#found_ajax'

end
