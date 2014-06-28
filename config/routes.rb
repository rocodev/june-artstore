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

  get 'search' => 'products#search'

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
    resources :card_charges
  end

  namespace :account do
    resources :orders
  end

  


  root :to => "products#index"
end
