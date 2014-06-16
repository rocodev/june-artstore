Rails.application.routes.draw do

  devise_for :users

	root :to => "products#index"

	resources :products do
		member do
			post :add_to_cart
		end
	end

	namespace :admin do
		root :to => "products#index"
		resources :products
  end
end
