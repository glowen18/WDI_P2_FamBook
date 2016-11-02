Rails.application.routes.draw do

  root 'static_pages#home'

  get 'signup' => 'users#new'
  post '/users' => 'users#create'

  get '/login' => 'sessions#new', as: :new_session
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :users
  resources :boards do
    resources :stories
  end
end
