feature 'Logout' do
  scenario 'user can logout' do
    signed_in
    click_link('Logout')
    expect(page.current_path).to eq('/')
  end
end