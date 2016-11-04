require 'rails_helper'
require_relative '../support/login_helper'

feature 'Reports Dashboard' do
  before(:each) { login }
  scenario 'User should see the link to create a report' do
    expect(page).to have_content('Submit a report')
    save_and_open_page
  end

  scenario 'User should be directed to reports form' do
    click_on 'Submit a report'

    expect(page).to
  end
end