Rails.application.routes.draw do
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :bets, :contests

  resources :contests do
    member do
      get 'edit_positions'
    end
  end

	root "static_pages#home"
end
