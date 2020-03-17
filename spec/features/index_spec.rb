feature 'Going to landlord path from index' do
  scenario 'Directing to landlord dashboard' do
    visit ('/')
    click_button "Landlord Login"
    expect(page).to have_content "Test landlord_dashboard"
  end
end

feature 'Going to renter path from index' do
  scenario 'Directing to renter dashboard' do
    visit ('/')
    click_button "Renter Login"
    expect(page).to have_content "Test renter_dashboard"
  end
end
