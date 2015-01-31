Bigmouth::Engine.routes.draw do
  root "articles#index"

  resources :articles

  namespace :admin do
    root "articles#index"
    resources :articles
  end
end
