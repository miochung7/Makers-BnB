feature 'Spaces' do
  scenario 'user can view list of spaces' do
    signed_in
    expect(current_path).to eq('/spaces')
    expect(page).to have_content('Cottage in Cotswold')
  end
end