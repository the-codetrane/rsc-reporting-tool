def login
  visit '/'
  fill_in 'Email', with: ENV['LOGIN_USER']
  fill_in 'Password', with: ENV['LOGIN_PASS']
  click_button ('Sign in')
end