require 'bookmark'

describe Bookmark do
  it 'has a list of bookmarks' do
    expect(Bookmark.all).to eq []
  end
end
