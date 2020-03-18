feature 'Going to landlord path from index' do
  scenario 'Directing to landlord login' do
    visit ('/')
    click_button "Landlord Login"
    expect(page).to have_content "Landlord signin"
  end
end

feature 'Going to renter path from index' do
  scenario 'Directing to renter dashboard' do
    visit ('/')
    click_button "Renter Login"
    expect(page).to have_content "Test renter_dashboard"
  end
end
