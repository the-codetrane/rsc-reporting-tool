require 'rails_helper'
require_relative '../support/login_helper'

feature 'Reports Dashboard' do

  before(:all) do
    FactoryGirl.create_list(:admin, 4)
    FactoryGirl.create(:role)
  end

  scenario 'User should see the link to create a report' do
    sign_up_admin
    visit root_path
    expect(page).to have_content('Submit A New Report')
  end

  scenario 'User should be directed to reports form' do
    sign_up_admin
    visit root_path
    click_link 'Submit A New Report'

    expect(page).to have_content('New Report Form')
  end
end