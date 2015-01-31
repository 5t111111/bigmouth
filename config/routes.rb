Bigmouth::Engine.routes.draw do
  root "articles#index"

  resources :articles

  get "admin" => "admin/articles#index"
  get "admin/articles" => "admin/articles#index"

end
