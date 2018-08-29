require './app'

feature 'bookmark list' do
  scenario 'can output users bookmarks' do
    visit '/'
    click_button 'Show Bookmarks'
    expect(page).to have_content "Bookmarks:"
  end
end
