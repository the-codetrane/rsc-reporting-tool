Rails.application.routes.draw do



  resources :reports

  devise_for :users

  root to: 'welcome#index'

  get '/admin', to: 'admin#index'

  scope '/admin' do
    resources :members, :groups
  end

  #email routes
  get 'send_committee_report_email/:id', to: 'reports#send_committee_report_email', as: 'committee_email'
  get 'send_rsc_report_email', to: 'reports#send_rsc_report_email', as: 'rsc_email'

end
