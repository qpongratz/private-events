Rails.application.routes.draw do
  resources :events, only: [:index]

  root 'events#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
