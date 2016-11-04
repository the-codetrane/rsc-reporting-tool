Rails.application.routes.draw do

  get 'users/edit'

  get 'users/show'

  resources :users, only: [:edit, :show]
  resources :reports
  devise_for :users

  root to: 'welcome#index'

end
