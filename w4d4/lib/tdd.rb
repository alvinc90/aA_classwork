class Array 

    def my_uniq
        new_arr = [] 
        self.each do |ele| 
            new_arr << ele if !new_arr.include?(ele) 
        end
        new_arr 
    end

    def two_sum 
        pairs_arr = [] 
        (0..self.length - 1).each do |i| 
            (i + 1..self.length - 1).each do |j| 
                pairs_arr << [i, j] if self[i] + self[j] == 0 
            end
        end
        pairs_arr 
    end

    def my_transpose
        self.transpose
    end

    def stock_picker 
        min = 0 
        min_i = 0 
        max = 0
        max_i = 0 
        self.each_with_index do |num, i|
            if num < min 
                min = num 
                min_i = i  
            elsif num > max  
                max = num 
                max_i = i  
            end
        end
        [min_i, max_i] 
    end
end

