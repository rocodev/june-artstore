Rails.application.routes.draw do

  devise_for :users

	root :to => "products#index"

	namespace :admin do
		root :to => "products#index"
		resources :products
  end
end
