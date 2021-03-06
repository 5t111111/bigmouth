Bigmouth::Engine.routes.draw do
  get "admin" => redirect("admin/articles")
  resources :articles, only: %i(index show), path: ""
  root "articles#index"

  namespace :admin do
    resources :articles
    resources :images
    root "articles#index"
  end
end
