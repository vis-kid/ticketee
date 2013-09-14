Ticketee::Application.routes.draw do

	root :to => 'projects#index'

	resources :users, only: [:new, :create]

	resources :projects do
		resources :tickets
	end

end
