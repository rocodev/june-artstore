Rails.application.routes.draw do

  devise_for :users
  namespace :admin do 
    resources :products
  end


  resources :procuts

  root :to => "products#index"
end
