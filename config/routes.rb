Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 get '/comedians', to: 'comedians#index'
 get '/comedians/:id', to: 'comedians#new'
 post '/comedians', to: 'comedians#create'
  # resources :comedians
end
