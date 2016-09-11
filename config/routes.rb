Rails.application.routes.draw do

  root 'application#root'

  devise_for :users, controllers: {
      passwords: 'passwords'
  }

  resources :users, except: [:show] do
    resources :posts, only: [:create, :destroy, :update], shallow: true do
      resources :images, only: [:create], shallow: true
    end
  end
  get 'home', to: 'users#home'

  resources :settings, only: [:index] do
    get 'account', on: :collection
    delete 'account', to: 'settings#account_destroy', on: :collection
  end

end
