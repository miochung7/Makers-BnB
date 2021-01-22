def log_in
  visit('/login')
  fill_in('email', with: 'test@gmail.com')
  fill_in('password', with: 'test1234')
  click_button('Login')
end