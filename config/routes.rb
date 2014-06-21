Rails.application.routes.draw do

  devise_for :users

	root :to => "products#index"

	resources :cart_items
	resources :orders do
		member do
			get :pay_with_credit_card
		end
	end

	resources :carts do
		collection do 
			post :checkout
		end
	end

	resources :products do
		member do
			post :add_to_cart
		end
	end

	namespace :account do
		resources :orders do
			member do
				post :cancel
				post :return
			end
		end
	end

	namespace :admin do
		root :to => "products#index"
		resources :products
		resources :orders do
			member do
				post :shipping
				post :shipped
				post :cancel
				post :return
			end
		end
  end
end
