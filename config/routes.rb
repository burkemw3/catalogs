Catalogs::Application.routes.draw do
  match "/auth/:provider/callback" => "authentication#create"
  resources :authentication

  get "home/index"

  root :to => "home#index"
end
