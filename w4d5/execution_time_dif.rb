def my_min(list)
    list.each do |s_num|
        return s_num if list.all? { |check_num| s_num <= check_num}
    end
end



# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)  # =>  -5


def my_min(list) 
    smallest = list[0]
    list.each {|num| smallest = num if num <= smallest}
    smallest 
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)  # =>  -5


def largest_contiguous_subsum(list)  #n^3 

    solution = []
    0.upto(list.length - 1).each do |i1|
        i1.upto(list.length - 1).each do |i2|
            solution << list[i1..i2]
        end
    end
    solution.inject(solution.first.sum) do |acc, subarr|
        if acc > subarr.sum
            acc
        else
            subarr.sum
        end
    end
end


def largest_contiguous_subsum(list) #n 
    biggest = list[0]
    current_sum = list[0] 
    (1...list.length).each do |i| 
        if current_sum < 0
            current_sum = 0
        end
        current_sum += list[i] 
        biggest = current_sum if current_sum > biggest
    end
    biggest 
end

list1 = [5, 3, -7]
p largest_contiguous_subsum(list1) # => 8



list2 = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum(list2) # => 8 (from [7, -6, 7])


list3 = [-5, -1, -3]
p largest_contiguous_subsum(list3) # => -1 (from [-1])


# def largest_contiguous_subsum(list) n ^ 3
#     return list[0] if list.length == 1
#     sum = list[0]
#     (list.length-1).downto(0).each do |i|
#         comp = list[0..i].sum
#         if comp > sum
#             sum = comp
#         end
#     end
#     comp =  largest_contiguous_subsum(list[1..-1])
#     if sum > comp 
#         return sum
#     else
#         return comp 
#     end
# end

# list1 = [5, 3, -7]
# p largest_contiguous_subsum(list1) # => 8



# list2 = [2, 3, -6, 7, -6, 7]
# p largest_contiguous_subsum(list2) # => 8 (from [7, -6, 7])


# list3 = [-5, -1, -3]
# p largest_contiguous_subsum(list3) # => -1 (from [-1])