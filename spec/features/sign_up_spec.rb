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