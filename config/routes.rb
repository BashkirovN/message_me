Rails.application.routes.draw do
  root 'chatroom#index'

  get 'signup', to: 'users#new'
  # A single call to resources can declare all of the necessary routes for your index,
  #    show, new, edit, create, update, and destroy actions.
  resources :users, except: [:new]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout',to: 'sessions#destroy'


  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
