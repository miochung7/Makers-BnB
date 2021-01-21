feature 'Login' do
  scenario 'existing user can log in' do
    visit('/')
    signed_in
    #logout when this feature is introduced
    log_in
    expect(current_path).to eq('/spaces')
  end

  end 