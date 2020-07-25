class Song < ActiveRecord::Base
  # add associations here
   belongs_to :artist
   belongs_to :genre
   has_many :notes

   def artist_name
     self.artist.name
   end

   def artist_name=(name)
     self.artist = Artist.find_or_create_by(name: name)
   end

   def genre_name
     self.genre.name
   end

   def genre_name=(name)
     self.genre = Genre.find_or_create_by(name: name)
   end

   def note_contents
     self.notes.map do |note|
       note.content
     end

   end

   def note_contents=(notes)
    
     notes.each do |note|
       next if note == ""
         n = Note.find_or_create_by(content: note)
         self.notes << n

       end
     end

end
