require 'pg'
require 'uri'

class Bookmark

  # thanks stackoverflow, check out this module later
  def self.all
    # ObjectSpace.each_object(self).to_a
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect :dbname => 'bookmark_manager_test'
    else
      con = PG.connect :dbname => 'bookmark_manager'
    end
    result = con.exec('SELECT * FROM bookmarks')
    result.map { |bookmark| bookmark['url'] }
  end

  def self.create(url)
    return false unless is_url?(url)
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect :dbname => 'bookmark_manager_test'
    else
      con = PG.connect :dbname => 'bookmark_manager'
    end
    con.exec("INSERT INTO bookmarks (url) VALUES('#{url}')")
  end

  private 

  def self.is_url?(url)
    url =~ /\A#{URI::regexp(['http', 'https'])}\z/
  end

end
