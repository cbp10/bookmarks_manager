feature 'add' do
  scenario 'raise error when adding an incorrect url' do
    visit('/')
    fill_in :add_url, with: "ww.bbc,co,uk"
    click_button 'submit'
    expect(page).not_to have_content "ww.bbc,co,uk"
    expect(page).to have_content("You must submit a valid URL")
  end
end