Catalogs::Application.routes.draw do
  match "/auth/:provider/callback" => "authentications#create"
  resources :authentications

  get "home/index"

  root :to => "home#index"
end
