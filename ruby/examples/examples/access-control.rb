class A
  protected
    def foo
      2
    end

end

class B < A
  def foo1
    puts "foo1"
    foo
  end
end

puts B.new.foo1
puts A.fooP
