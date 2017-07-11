Rails.application.routes.draw do

  resources :area_reports
  resources :sub_committee_reports
  resources :reports

  devise_for :users

  root to: 'welcome#index'

  get '/admin', to: 'admin#index'

  scope '/admin' do
    resources :members, :groups
  end

  #email routes
  get 'send_sub_committee_report_email/:id', to: 'sub_committee_reports#send_report_email', as: 'committee_email'
  get 'send_area_report_email/:id', to: 'area_reports#send_report_email', as: 'area_email'
  get 'send_rsc_report_email', to: 'admin#send_rsc_report_email', as: 'rsc_email'

end
