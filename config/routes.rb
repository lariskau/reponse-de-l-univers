Rails.application.routes.draw do
  get 'sessions/new'
  root 'static#home'

  get '/club', to: 'static#club'

  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'

  resources :users

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get '/logout',  to: 'sessions#destroy'
  delete '/logout',  to: 'sessions#destroy'
end
