feature 'Logout' do
  scenario 'user can logout' do
    signed_in
    click_on("Logout")
    expect(current_path).to eq('/')
  end
end