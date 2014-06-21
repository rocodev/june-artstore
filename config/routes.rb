Rails.application.routes.draw do

  devise_for :users
  namespace :admin do 
    resources :products
    resources :orders
  end

  namespace :account do 
    resources :orders
  end  



  resources :products do 
    member do 
      post :add_to_cart
    end
  end

  resources :carts do 
    collection do 
      post :delete_all
      post :delete_item
      post :change_item_quantity
<<<<<<< HEAD
=======
    end
  end




  resources :carts do 
    collection do 
>>>>>>> a955128c9981f798687577928ec239732f747e56
      post :checkout
    end
  end

  resources :orders

  resources :orders do 
    member do 
      get :pay_with_credit_card
    end
  end
  

  root :to => "products#index"


end
