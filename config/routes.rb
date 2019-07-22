Rails.application.routes.draw do 

	resources :projects
	resources :users
	resources :sessions
	resources :search, only: [:index]

	root 'home#index'

end
