Rails.application.routes.draw do

  root 'application#root'

  devise_for :users, controllers: {
      passwords: 'passwords'
  }

  resources :users do

    post 'search', on: :collection

    resources :posts, only: [:create, :destroy, :update], shallow: true do
      resources :images, only: [:create], shallow: true
    end

    resources :invitations, only: [:create, :destroy], shallow: true do
      post 'accept', on: :member
      delete 'reject', on: :member
    end

  end

  resources :friendships, only: [:destroy]

  get 'home', to: 'users#home'

  resources :settings, only: [:index] do
    get 'account', on: :collection
    delete 'account', to: 'settings#account_destroy', on: :collection
  end

end
