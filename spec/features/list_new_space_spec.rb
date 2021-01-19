feature 'Space' do
  scenario 'user can list new space' do
    signed_in
    click_link('List a Space')
    expect(page.current_path).to eq('/spaces/new')
  end
end