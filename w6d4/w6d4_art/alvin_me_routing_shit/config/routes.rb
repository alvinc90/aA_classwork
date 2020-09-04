Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :users

  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show'
  post '/users/', to: 'users#create'
  patch '/users/:id', to: 'users#update'
  delete '/users/:id', to: 'users#destroy'

  resources :artworks, only:[:index, :show, :create, :update, :destroy] 
end
