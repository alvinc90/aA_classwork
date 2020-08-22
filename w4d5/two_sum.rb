def bad_two_sum?(arr, target)
    arr.each do |i1|
        return true if arr.any?{ | i2 | i1 + i2 == target && i1 < i2}
    end
    false
end


# arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false


def okay_two_sum?(arr, target) #O(n)
    arr = arr.sort 
    (0...arr.length - 1).each do |i|
        if arr[i] + arr[i+1] == target 
            return true 
        elsif arr[i] + arr[i+1] > target
            return false
        end
    end
end

# arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false


# def quick_sort(arr)
#     return arr if arr.length <= 1
#     pivot = arr[0]
#     smaller = arr[1..-1].select{ | ele | pivot > ele }
#     bigger = arr[1..-1].select{ | ele | pivot <= ele }
#     quick_sort(smaller) + [pivot] + quick_sort(bigger)
# end

# arr = [7,2,8,4,9,11]
# p okay_two_sum?(arr, 1) # => should be true
# p okay_two_sum?(arr, 20) # => should be false


# def two_sum?(arr, target)
#     hash = Hash.new(0)
#     arr.each do |ele|
#         hash[ele] += 1 if ele < target
#     end
#     hash.each_key do |ele|
#         return true if hash[target-ele] > 0
#     end
#     false
# end


# def two_sum?(arr, target)
#     0.upto(arr.length - 1).each do |i|
#     unless arr.find_index(target-1).nil?
#         return true unless arr.find_index( target - arr[(arr.find_index(target-i))].nil? 
#     end
#     false
# end

def two_sum?(arr, target)
    hash = Hash.new(0)
    arr.each do |ele|
        hash[ele] += 1
        return true if hash[target-ele] > 0
    end
    
    false 
end



# arr = [7,2,8,4,9]
# p two_sum?(arr, 6) # => should be true
# p two_sum?(arr, 20) # => should be false
