Rails.application.routes.draw do

  root 'application#root'

  devise_for :users

  resources :users

end
