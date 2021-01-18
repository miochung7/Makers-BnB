feature 'Sign up' do
  scenario 'user can sign up' do
    visit('/')
    signed_in
    expect(current_path).to eq('/spaces')
  end
end