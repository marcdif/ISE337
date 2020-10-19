k = 0
(1..10).each { |y|
  break if k == 1
  next if y < 3
  puts y
  if y == 5
    k = 1
    redo
  end
}
