feature 'Going to the right page from the landlord dashboard' do
  scenario 'Go to list property' do
    visit ('/account/landlord')
    click_button "List a new property"
    expect(page).to have_content "Test list_property"
  end
end
