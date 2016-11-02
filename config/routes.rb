Rails.application.routes.draw do

  root 'static_pages#home'

  get '/login' => 'sessions#new', as: :login
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy', as: :logout

  resources :users
  resources :boards do
    resources :stories
  end
end
