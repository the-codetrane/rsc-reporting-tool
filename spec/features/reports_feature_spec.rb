require 'rails_helper'
require_relative '../support/login_helper'

feature 'Reports Dashboard' do

  before(:all) do
    FactoryBot.create_list(:admin, 4)
    FactoryBot.create(:role)
  end

  scenario 'User should see the link to create a sub-committee report' do
    sign_up_admin
    visit root_path
    expect(page).to have_content('Submit A Sub-Committee Report')
  end

  scenario 'User should see the link to create an area report' do
    sign_up_admin
    visit root_path
    expect(page).to have_content('Submit An Area Report')
  end


  scenario 'User should be directed to new sub-committee reports form' do
    sign_up_admin
    visit root_path
    click_link 'Submit A Sub-Committee Report'

    expect(page).to have_content('New Sub-Committee Report Form')
  end

  scenario 'User should be directed to new area reports form' do
    sign_up_admin
    visit root_path
    click_link 'Submit An Area Report'

    expect(page).to have_content('New Area Report Form')
  end
end