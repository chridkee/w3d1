class Array 
    def my_each(&prc)
        i = 0 
        while i < self.length 
            prc.call(self[i])
            i+=1
        end
    end

    def my_select(&prc)
        arr = []
        self.my_each do |ele|
            if prc.call(ele) == true 
                arr << ele
            end
        end
        return arr 
    end

end

print a = [1, 2, 3]
print a.my_select { |num| num > 1 } # => [2, 3]
print a.my_select { |num| num == 4 } # => []