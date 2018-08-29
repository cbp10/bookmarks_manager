feature 'add' do
  scenario 'add a bookmark' do
    visit('/')
    fill_in :add_url, with: "http://www.bbc.co.uk"
    click_button 'submit'
    expect(page).to have_content("http://www.bbc.co.uk")
  end
end
