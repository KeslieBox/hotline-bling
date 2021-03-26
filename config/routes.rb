Rails.application.routes.draw do
  
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  
  get '/signup', to: 'dispatchers#new'
  resources :callers
  resources :dispatchers
  resources :calls
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
