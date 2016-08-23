Rails.application.routes.draw do

  root 'application#root'

  devise_for :users

  resources :users
  get 'home', to: 'users#home'

  resources :settings, only: [:index] do
    get 'account', on: :collection
  end

end
