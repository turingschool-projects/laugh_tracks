Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "comedians#index"

  resources :comedians, only: [:index, :show, :new, :create]

end
