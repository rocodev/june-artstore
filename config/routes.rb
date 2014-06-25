Rails.application.routes.draw do

  devise_for :users
  namespace :admin do
    resources :products
    resources :orders do
      member do 
        get :change_state_to_shipping
        get :change_state_to_order_cancelled
        get :change_state_to_good_returned
      end
    end
  end


  resources :products do
    member do
      post :add_to_cart
    end
  end

  resources :carts do
    collection do
      post :checkout
    end

    resources :items, :controller => "cart_items" 
  end

  resources :orders do 
    member do 
      get :pay_with_credit_card
      get :change_state_to_shipped
    end
  end

  namespace :account do
    resources :orders
  end

  resources :card_charges


  root :to => "products#index"
end
