feature 'Sign up' do
  scenario 'user can sign up' do
    visit('/')
    fill_in('email', with: 'test@gmail.com')
    fill_in('password', with: 'test1234')
    click_button('Sign Up')
    expect(current_path).to eq('/spaces')
  end
end