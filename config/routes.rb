Rails.application.routes.draw do

  resources :users
  resources :boards do
    resources :stories
  end
end
