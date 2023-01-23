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

    def my_any?(&prc)
        count = 0
        self.my_each do |ele|
            if prc.call(ele) == true
                count += 1
            end
        end
        if count > 0 
            return true
        else
            false
        end
    end


    def my_all?(&prc)
        count = 0
        length = self.length
        self.my_each do |ele|
            if prc.call(ele) == true
                count += 1
            end
        end
        if count == length
            return true
        else
            false
        end
    end

    def my_flatten
        arr = []
        self.each do |ele|
            if (ele.is_a?(Array))
                arr.concat(ele.my_flatten)
            else 
                arr << ele
            end
        end
        return arr
    end

end


p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]
