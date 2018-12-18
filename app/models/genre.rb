class Genre < ActiveRecord::Base
  # add associations
  has_many :songs

  def genre_ids=(ids)
   ids.each do |id|
     genre = Genre.find(id)
     self.genres << genre
   end
 end
end
