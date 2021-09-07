Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users
  root to: 'books#index'
  resources :users do
    member do
      get :following, :followers
    end
  end
  # resources :users, only: %i(index show edit update) do
  #   resource :relationships, only: %i(create destroy)
  #   get 'followings' => 'relationships#followings', as: 'followings'
  #   get 'followings' => 'relationships#followers', as: 'followers'
  # end
  resources :books
  resources :users, only: %i(index show)
  resources :relationships, only: %i(create destroy)
  resources :relationships, only: %i(create destroy)
end
