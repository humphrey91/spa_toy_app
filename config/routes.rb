Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :users, only: [:index, :show]

  resources :microposts, path: :posts

  root 'users#index'

end
