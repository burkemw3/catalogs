Catalogs::Application.routes.draw do
  match "/auth/:provider/callback" => "authentications#create"
  resources :authentications
  get "signout" => "sessions#destroy", :as => "signout"
  
  resources :calls

  resources :boxes

  resources :publishers do
    resources :catalogs
    resources :calls
  end

  resources :catalogs do
    resources :boxes
  end

  get "home/index"

  root :to => "home#index"
end
