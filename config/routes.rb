Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations', passwords: 'users/passwords' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "posts#index"

  resources :posts do
    resources :comments
  end

  # like in posts
  resources :likes, only: [:create, :update, :destroy]

  # follow users
  resources :follows, only: [:create, :destroy]

  # bookmark
  resources :bookmarks, only: [:create]

  # account
  get '/accounts/:id', to: 'accounts#show', as: 'account'
  get '/accounts/:id/bookmark', to: 'accounts#bookmark', as: 'account_bookmark'
  get '/accounts/:id/following', to: 'accounts#following', as: 'account_following'
  get '/accounts/:id/follower', to: 'accounts#follower', as: 'account_follower'

end
