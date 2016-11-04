require 'rails_helper'
require_relative '../support/login_helper'

feature 'Reports Dashboard' do
  scenario 'User should see the link to create a report' do
    sign_up
    expect(page).to have_content('Submit A New Report')
  end

  scenario 'User should be directed to reports form' do
    sign_up
    click_link 'Submit A New Report'

    expect(page).to have_content('New report for')
  end
end