Bigmouth::Engine.routes.draw do
  get "/admin" => "admin/articles#index"
  resources :articles, only: %i(index show), path: "/"
  root "articles#index"

  namespace :admin do
    resources :articles
    root "articles#index"
  end
end
