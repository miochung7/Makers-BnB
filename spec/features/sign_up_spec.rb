=begin
feature 'Sign up' do
  scenario 'signing up successfully directs user to view spaces' do
    visit('/')
    signed_in
    expect(current_path).to eq('/spaces')
  end

  scenario 'signing up adds user credentials to database' do
    visit('/')
    signed_in
    users = User.all
    expect(users).to include ('test@gmail.com')
    p users
  end
end
=end
feature 'registration' do
  scenario 'a user can sign up' do
    signed_in
    click_button('Sign Up')
    
    expect(page).to have_content "test@gmail.com"
  end
end
