require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns a list of bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://askjeeves.com')")
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com')")
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.google.com')")

      bookmarks = Bookmark.all

      expect(bookmarks).to include "http://askjeeves.com"
      expect(bookmarks).to include "http://www.makersacademy.com"
      expect(bookmarks).to include "http://www.google.com"
    end
  end

  describe '.create' do
    it 'does not create a new bookmark if URL is invalid' do
      Bookmark.create('ww,bb,')
      expect(Bookmark.all).not_to include 'www,bb,'
    end
  end
end
