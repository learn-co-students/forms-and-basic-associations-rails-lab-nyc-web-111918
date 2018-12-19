class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    #What is this doing agian
    #if the instance of the artist give me artist name, else give me nothing!
    self.artist ? self.artist.name : nil
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    #What is this doing agian
    #if the instance of the genre give me genre name, else give me nothing!
    self.genre ? self.genre.name : nil
  end

  def note_contents=(notes)
    notes.each do |note|
      if note != ""
        self.notes.build(content: note)
      end
    end
  end

  def note_contents
    self.notes.map{|note| note.content}
  end

end
