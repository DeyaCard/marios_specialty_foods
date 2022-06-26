Rails.application.routes.draw do
  devise_for :users
  root to: "products#home"
  get "home" => "products#home"
  resources :products do 
    resources :reviews
  end
end
