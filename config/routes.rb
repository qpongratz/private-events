Rails.application.routes.draw do
  devise_for :users
  resources :events, only: %i[index new create show]
  resources :users, only: %i[show]

  root 'events#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
