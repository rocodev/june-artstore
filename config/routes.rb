Rails.application.routes.draw do

  devise_for :users
  namespace :admin do 
    resources :products
  end


  resources :products
  resources :carts
  root :to => "products#index"

  resources :products do 
    member do 
      post :add_to_cart
    end
  end
end
