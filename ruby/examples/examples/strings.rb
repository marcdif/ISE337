data = <<STR_TERM
/jazz/j00132.mp3  | 3:45 | Fats     Waller     | Ain't Misbehavin'
/jazz/j00319.mp3  | 2:58 | Louis    Armstrong  | Wonderful World
/bgrass/bg0732.mp3| 4:09 | Strength in Numbers | Texas Red
STR_TERM

data = data.split("\n")
songs = Array.new
data.length.times { |i|
  tmp = data[i].split(/\s*\|\s*/)
  tmp[2].squeeze!(" ")
  tmp[2].gsub!(/\b\w/) { $&.upcase }
  mins, secs = tmp[1].scan(/\d+/)
  tmp[1] = mins.to_i*60 + secs.to_i
  songs[i] = tmp
}

print songs
print "\n"



# songs.each do |item|
#   print item[2][item[2].index(' ')+1,4]
# end
# print "\n"
