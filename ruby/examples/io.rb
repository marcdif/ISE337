arr = IO.readlines("/Users/Joy/CSE337/code-examples/python/sample.txt")
puts arr.inspect
puts "length = #{arr.length}"


puts "-----copying a file-----"

File.open("/Users/Joy/CSE337/code-examples/ruby/sample.txt", "w")  do |aFile|
  File.open("/Users/Joy/CSE337/code-examples/python/sample.txt", "r")  do |aFile1|
      aFile1.each_line { |line|
        aFile.puts line
      }
  end
end
puts "done"

puts "-----demonstrating IO.foreach-----"

IO.foreach("/Users/Joy/CSE337/code-examples/python/sample.txt") { |line|
  puts line
}
