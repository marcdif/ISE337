def testingHere(stringName)
    "Hello there, #{stringName}!";
end

puts testingHere('Marc')

array = [1, 2, 3, 4, 5]

puts array[1].to_i;

array.each do |val|
    puts val
end