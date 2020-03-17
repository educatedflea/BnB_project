feature 'Going to the right page from the landlord dashboard' do
  scenario 'Go to list property' do
    visit ('/account/landlord')
    click_button "List a new property"
    expect(page).to have_content "Test list_property"
  end
end

feature 'Going to the right page from the landlord dashboard' do 
  scenario 'Going to pending request' do 
    visit ('/account/landlord')
    click_button 'See my pending requests'
    expect(page).to have_content "Test pending_requests"
  end 
end 