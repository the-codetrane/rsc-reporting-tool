require 'rails_helper'

feature 'Registration' do

  before(:all) do
    FactoryBot.create_list(:admin, 4)
    FactoryBot.create(:role)
  end

  scenario 'User signs up successfully' do

    visit '/users/sign_up'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'thisismypassword'
    fill_in 'Password confirmation', with: 'thisismypassword'
    fill_in 'First name', with: 'Testy'
    fill_in 'Last name', with: 'Testifarious'
    click_on 'Sign up'

    expect(page).to have_content('Welcome! You have signed up successfully')
  end

  scenario 'User signs up without matching password' do

    visit '/users/sign_up'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'thisismypassword'
    fill_in 'Password confirmation', with: 'test'
    fill_in 'First name', with: 'Testy'
    fill_in 'Last name', with: 'Testifarious'
    click_on 'Sign up'

    expect(page).to have_content('Password confirmation doesn\'t match')
  end

  scenario 'User signs up without first name' do

    visit '/users/sign_up'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'thisismypassword'
    fill_in 'Password confirmation', with: 'thisismypassword'
    fill_in 'Last name', with: 'Testifarious'
    click_on 'Sign up'

    expect(page).to have_content('First name can\'t be blank')

  end
end