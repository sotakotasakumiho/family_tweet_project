Rails.application.routes.draw do
  get "login" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"

  resources :users
  

  resources :posts do
    resources :likes, only: [:index, :create, :destroy]
  end

  
  

  root 'home#index'
  resources :home, only: [:index, :show]
  
end

