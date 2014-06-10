Rails.application.routes.draw do
	
	get "admin/" => "admin#index"

	namespace :admin do
		resources :products
  end
end
