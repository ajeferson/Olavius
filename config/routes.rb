Rails.application.routes.draw do

  root 'application#root'

  devise_for :users

  resources :users do
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
