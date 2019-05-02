Rails.application.routes.draw do


  get '/players', to: 'players#index'
  get '/players/new', to: 'players#new'
  post '/players', to: 'players#create'

end
