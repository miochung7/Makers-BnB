feature 'Logout' do
  scenario 'user can logout' do
    signed_in
    click_button('logout')
    expect(page.current_path).to eq('/')
  end
end