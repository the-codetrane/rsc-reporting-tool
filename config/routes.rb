Rails.application.routes.draw do

  resources :users, only: [:edit, :show]
  resources :reports
  devise_for :users

  root to: 'welcome#index'

end
