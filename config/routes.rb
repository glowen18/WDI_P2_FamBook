Rails.application.routes.draw do

  root 'welcome#index'

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
