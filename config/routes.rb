Rails.application.routes.draw do
  require 'sidekiq/web'
  
  root 'users#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  resources :users, only: [:index, :show]

  resources :microposts, path: :posts

  mount Sidekiq::Web => '/sidekiq'
  mount ActionCable.server => '/cable'

end
