Rails.application.routes.draw do
  root to: "pages#home"
  devise_for :users
  namespace :admin do
    resources :products
    resources :orders do
      member do
        post :ship
        post :deliver
        post :cancel_order
        post :return_good
        post :state_transition
      end
    end
  end

  resources :products do
    member do
      post :add_to_cart
      post :del_from_cart
    end
  end

  resources :carts do
    member do
      post :checkout
    end
  end

  resources :orders do
    member do
      get :pay_with_credit_card
    end
  end

  namespace :account do
    resources :orders
  end
end
