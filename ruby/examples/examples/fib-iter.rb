def fibUpTo(max)
  i1, i2 = 1, 1        # parallel assignment
  while i1 <= max
    print i1, " "
    i1, i2 = i2, i1+i2
  end
end
fibUpTo(1000)
print "\n"
