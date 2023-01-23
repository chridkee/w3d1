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

    def my_reject(&prc)
        arr = []
        self.my_each do |ele|
            if prc.call(ele) != true 
                arr << ele
            end
        end
        return arr 
    end

end

a = [1, 2, 3]
p a.my_reject { |num| num > 1 } # => [1]
p a.my_reject { |num| num == 4 } # => [1, 2, 3]
