# Marc DiFilippo - 111420881
# ISE 337 HW2 Part 1

class Array
    alias_method :old_arr, :[]

    def [](index, second_index = nil)
        if second_index != nil
            return self.old_arr(index, second_index)
        end
        if index >= size || index < (-1 * size)
            return '\0'
        end
        return self.at(index)
    end

    def []=(index, value)
    end

    def map(index=nil)
        if index == nil
            return super()
        else
            arr = self.slice(index)
            if arr == nil
                return []
            else
                i = 0
                arr.each do |x|
                    if x != nil
                        arr.delete_at(i)
                        arr.insert(i, yield(x))
                        i = i + 1
                    end
                end
                return arr
            end
        end
    end
end
