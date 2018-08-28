class Bookmark

  # thanks stackoverflow, check out this module later
  def self.all
    ObjectSpace.each_object(self).to_a
  end
  
end
