Rails.application.routes.draw do

  resources :members, only: [:show, :edit, :update]

  resources :groups, only: [:show, :edit, :update]

  resources :reports

  devise_for :users

  root to: 'welcome#index'

  resources :admin

  #email routes
  get 'send_committee_report_email/:id', to: 'reports#send_committee_report_email', as: 'committee_email'
  get 'send_rsc_report_email', to: 'reports#send_rsc_report_email', as: 'rsc_email'

end
