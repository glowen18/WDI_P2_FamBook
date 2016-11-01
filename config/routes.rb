Rails.application.routes.draw do

  root 'static_pages#home'

  get 'static_pages/home'
  get 'static_pages/help'

  get '/login' => 'sessions#new', as: :new_session
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get 'signup' => 'users#new'
  post '/users' => 'users#create'

  resources :users
  resources :boards do
    resources :stories
  end
end
