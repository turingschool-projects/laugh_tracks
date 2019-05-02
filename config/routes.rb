Rails.application.routes.draw do
  get '/comedians', to: 'comedians#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
