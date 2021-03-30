Rails.application.routes.draw do
  root 'static#home'
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  post 'logout', to: 'sessions#destroy'
  
  get '/signup', to: 'dispatchers#new'
  resources :callers
  resources :dispatchers do
    resources :calls
  end

  resources :calls
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
