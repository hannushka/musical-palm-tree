Rails.application.routes.draw do
  get 'static_pages/home'

	resources :users
	root "static_pages#home"
end
