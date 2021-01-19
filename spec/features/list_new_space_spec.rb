feature 'Space' do
  scenario 'user view the new space page' do
    signed_in
    click_link('List a Space')
    expect(page.current_path).to eq('/spaces/new')
  end

  scenario 'user can list a new space' do
    signed_in
    click_link('List a Space')
    fill_in('name', with: 'Penthouse in Canary Wharf')
    fill_in('description', with: '2 bed penthouse with lovely panoramic views across Canary Wharf')
    fill_in('price per night', with: '£120')
    fill_in('available from', with: '01/01/2021')
    fill_in('available to', with: '12/31/2021')
    click_button('List my space')
    expect(page).to have_content('Penthouse in Canary Wharf')
  end
end