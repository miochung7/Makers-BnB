feature 'log out button' do
  scenario 'kills session and user signs out' do
    signed_in
    expect(page.current_path).to eq('/spaces')
    click_link('Logout')
    expect(session).to eq nil
  end
end
