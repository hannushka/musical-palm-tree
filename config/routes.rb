Rails.application.routes.draw do
	resources :bets
	root "static_pages#home"
end
