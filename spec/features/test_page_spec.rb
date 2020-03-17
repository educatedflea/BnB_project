feature 'Viewing test page' do
	scenario 'visiting the test page' do
		visit('/test')
    expect(page).to have_content "Test page"

  
  end
  scenario 'visit home page' do
   visit('/')
   expect(page).to have_content "ViralBnB"
  end
end