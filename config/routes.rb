Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/shortUrl/:code', to: 'short_url#index'
  post '/shortUrl', to: 'short_url#create'
end
