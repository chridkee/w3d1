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


end


a = [1, 2, 3]
p a.my_all? { |num| num > 1 } # => false
p a.my_all? { |num| num < 4 } # => true