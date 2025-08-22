Rails.application.routes.draw do
  devise_for :users
  root to: "conspiracies#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  resources :users

  resources :conspiracies, only: [:index, :new, :create, :show, :update] do
    resources :comments, only: [:new, :create]
  end
  resources :votes, only: [:new, :create, :destroy]
  resources :chats do
    resources :messages, only: [:create]
  end

end
