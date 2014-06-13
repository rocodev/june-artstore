Rails.application.routes.draw do
	
  devise_for :users
	get "admin/" => "admin#index"

	namespace :admin do
		resources :products
  end
end
