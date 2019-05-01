Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/comedian/:age', to: 'comedians#sort_age', as: 'comedian_age'

  resources :comedians, only: [:index]
end
