Rails.application.routes.draw do

  resources :reports
  devise_for :users
root to: 'welcome#index'

end
