feature 'Homepage' do
  scenario 'visit the homepage' do
    visit('/')
    expect(page).to have_content('Sign up to MakersBnB')
  end
end
