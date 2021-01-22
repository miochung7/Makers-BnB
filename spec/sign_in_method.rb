def signed_in
  visit('/')
  fill_in('email', with: 'test@gmail.com')
  fill_in('password', with: 'test1234')
  click_button('Sign Up')
end
