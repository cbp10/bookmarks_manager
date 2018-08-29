require 'pg'

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
  
end
