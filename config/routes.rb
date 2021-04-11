Rails.application.routes.draw do
  root 'static#home'
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  post '/logout', to: 'sessions#destroy'

  get '/auth/google_oauth2/callback', to: 'sessions#create_w_google'
  
  get '/signup', to: 'dispatchers#new'
  post '/signup', to: 'dispatchers#create'
  get '/dispatchers/top_dispatcher', to: 'dispatchers#top_dispatcher'
  resources :callers
  resources :dispatchers do
    resources :calls
  end

  resources :calls
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
