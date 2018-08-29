require 'pg'

class Bookmark

  # thanks stackoverflow, check out this module later
  def self.all
    # ObjectSpace.each_object(self).to_a
    con = PG.connect :dbname => 'bookmark_manager'
    result = con.exec('SELECT * FROM bookmarks')
    p result
    result.map { |bookmark| bookmark['url'] }
  end
  
end
