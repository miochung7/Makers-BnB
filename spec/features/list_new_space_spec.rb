feature 'Space' do
  scenario 'user view the new space page' do
    signed_in
    click_link('List a Space')
    expect(page.current_path).to eq('/spaces/new')
  end

  scenario 'new space saves into the database' do
    signed_in
    # click_link('List a Space')
    # fill_in('name', with: 'Penthouse in Canary Wharf')
    # fill_in('description', with: '2 bed penthouse with lovely panoramic views across Canary Wharf')
    # fill_in('price per night', with: '£120')
    # fill_in('available from', with: '01/01/2021')
    # fill_in('available to', with: '12/31/2021')
    # click_button('Submit')


    space = Space.create_space(name: 'Penthouse in Canary Wharf', description: '2 bed penthouse with lovely panoramic views across Canary Wharf', price_per_night: '120', available_from: '01/01/2021', available_to: '12/31/2021')
    p space
    
    spaces = Space.all
    expect(spaces).to include(have_attributes(name: 'Penthouse in Canary Wharf'))
    
  end

  scenario 'once saved, user should be directed back to /spaces' do
    signed_in
    click_link('List a Space')
    fill_in('name', with: 'Penthouse in Canary Wharf')
    fill_in('description', with: '2 bed penthouse with lovely panoramic views across Canary Wharf')
    fill_in('price_per_night', with: '£120')
    fill_in('available_from', with: '01/01/2021')
    fill_in('available_to', with: '12/31/2021')
    click_button('Submit')
    expect(page.current_path).to eq('/spaces')
  end
  
end