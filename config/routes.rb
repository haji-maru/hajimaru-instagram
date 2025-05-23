require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq' if Rails.env.development?
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'posts#index'

  resources :posts

  resources :accounts, only: [:show] do
    resource :following, only: [:show]
    resource :follower, only: [:show]
  end

  scope module: :apps do
    resource :timeline, only: [:show]
    resource :profile, only: [:show, :update]
  end

  namespace :api, defaults: { format: :json } do
    scope '/posts/:post_id' do
      resource :like, only: [:show, :create, :destroy]
      resources :comments, only: [:index, :create]
    end

    scope '/account/:account_id' do
      resource :follow, only: [:show, :create]
      resource :unfollow, only: [:create]
    end
  end
end