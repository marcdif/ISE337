class Song
  def initialize(name, artist, duration)
    @name = name
    @artist = artist
    @duration = duration * 1000
  end
end

class Song

  attr_reader :name, :artist, :duration

  def to_s
    "Song: #{@name}--#{@artist} (#{@duration})"
  end
end

class KarokeSong < Song
  def initialize(name, artist, duration, lyrics)
    super(name, artist, duration)
    @lyrics = lyrics
  end

  def to_s
    super + "[#{@lyrics}]"
  end
end

class SongList
  MaxTime = 5*60

  def isTooLong(aSong)
    return aSong.duration > MaxTime
  end

end

class Logger
  private_class_method :new
  @@logger = nil
  def Logger.create
    @@logger = new unless @@logger
    @@logger
  end
end

class SongList
  def initialize
    @song = Array.new
  end

  def append(aSong)
    @song.push(aSong)
    self
  end

  def deleteFirst
    @song.shift
  end

  def deleteLast
    @song.pop
  end

  def [](key)
    if key.kind_of?(Integer)
      @song[key]
    else
      nil
    end
  end
end

aSong = Song.new("Hey Jude", "The Beatles", 260)
puts aSong.to_s

aKSong = KarokeSong.new("Hey Jude", "The Beatles", 260, "Whats that? camel sunshine ...")
puts aKSong.to_s

song1 = Song.new("Bicylops", "Fleck", 260)
puts (SongList.new).isTooLong(song1)

puts Logger.create.object_id
puts Logger.create.object_id

songs = SongList.new
songs.append(Song.new('title1', 'artist1', 1))
     .append(Song.new('title2', 'artist2', 2))
     .append(Song.new('title3', 'artist3', 3))
     .append(Song.new('title4', 'artist4', 3))

puts songs[0], songs[1], songs['Three']

puts songs.deleteFirst
puts songs.deleteFirst
puts songs.deleteLast
puts songs.deleteLast
