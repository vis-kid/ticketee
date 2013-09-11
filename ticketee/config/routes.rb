Ticketee::Application.routes.draw do
	root :to => 'projects#index'

	resources :projects, only: [:new, :create, :show]
end
