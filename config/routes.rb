Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :comedians, only: [:index]

  #this the best way of making this route?
  get "/comedians?age={:age=> :age}", to: 'comedians#index'
end
