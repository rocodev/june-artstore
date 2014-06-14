Rails.application.routes.draw do

  devise_for :users

	namespace :admin do
		root :to => "products#index"
		resources :products
  end
end
