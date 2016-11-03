require 'rails_helper'

feature 'Authorization' do
  scenario 'User signs up successfully' do

    visit '/users/sign_in'
    click_link 'Sign Up'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'thisismypassword'
    fill_in 'Password confirmation', with: 'thisimypassword'
    fill_in 'First name', with: 'Testy'
    fill_in 'Last name', with: 'Testifarious'
    click_on 'Sign up'

    expect(page).to include('Successfully')
  end
end