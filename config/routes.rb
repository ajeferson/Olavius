Rails.application.routes.draw do

  root 'application#root'

  devise_for :users

  resources :users
  get 'profile', to: 'users#profile'

end
