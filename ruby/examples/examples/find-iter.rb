class Array
  def find
    i = 0
    while i <= size
      value = self[i]
      return value if yield(value)
      i = i + 1
    end
    return nil
  end
end

puts [1, 3, 5, 7, 9].find {|v| v*v > 30 }
