def sign_up
  visit '/users/sign_up'
  fill_in 'Email', with: 'test@test.com'
  fill_in 'Password', with: 'thisismypassword'
  fill_in 'Password confirmation', with: 'thisismypassword'
  fill_in 'First name', with: 'Testy'
  fill_in 'Last name', with: 'Testifarious'
  click_on 'Sign up'
end