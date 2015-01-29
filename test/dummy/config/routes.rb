Rails.application.routes.draw do
  root 'users#index'
  resources :sessions
  resources :users

  get 'login' => 'sessions#new', :as => :login
  post 'logout' => 'sessions#destroy', :as => :logout

  mount Bigmouth::Engine, at: "/blog"
end
