feature 'Spaces' do
  scenario 'user can view list of spaces' do
    signed_in
    expect(current_path).to eq('/spaces')
  end
end
