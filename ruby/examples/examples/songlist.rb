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

class SongList
  def initialize
    @songs = Array.new
  end

  def append(aSong)
    @songs.push(aSong)
    self
  end

  def deleteFirst
    @songs.shift
  end

  def deleteLast
    @songs.pop
  end

  def [](key)
    if key.kind_of?(Integer)
      result = @songs[key]
    else
      result = @songs.find { |aSong| aSong.name == key }
    end
    return result
  end
end

songs = SongList.new
songs.append(Song.new('title1', 'artist1', 1))
     .append(Song.new('title2', 'artist2', 2))
     .append(Song.new('title3', 'artist3', 3))
     .append(Song.new('title4', 'artist4', 3))

puts "Song at index 0 : #{songs[0]}"
puts "Song at index 1: #{songs[1]}"
puts "Song with title1: #{songs['title2']}"

puts "--- testing delete first ---"
puts songs.deleteFirst
puts songs.deleteFirst
puts "--- testing delete last ---"
puts songs.deleteLast
puts songs.deleteLast
