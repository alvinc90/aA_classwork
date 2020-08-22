# Anagrams
# Our goal today is to write a method that determines if two given words are 
# anagrams. This means that the letters in one word can be rearranged to form 
# the other word. For example

# Phase I:
# Write a method #first_anagram? that will generate and store all the possible 
# anagrams of the first string. Check if the second string is one of these.

def anagram?(str1, str2)
    str_perm = str1.split("").permutation.to_a
    #str1 splits on each char and turns it into an array
    #permutation takes every possible combination of the letters in array
    #str2.
    str_perm.include?(str2.split(""))  

    # str_perm = str1.split("").permutation.to_a
    # str_perm.map!{ | ele | ele.join("") }
    # p str_perm
    # str_perm.include?(str2)


end


# p anagram?("gizmo", "sally")    #=> false
# p anagram?("elvis", "lives")    #=> true



# Phase II:
# Write a method #second_anagram? that iterates over the first string. For each 
# letter in the first string, find the index of that letter in the second string 
# (hint: use Array#find_index) and delete at that index. The two strings are 
# anagrams if an index is found for every letter and the second string is empty 
# at the end of the iteration.

# Try varying the length of the input strings. What are the differences between 
# #first_anagram? and #second_anagram??


def second_anagram?(str1, str2)
   str1_arr = str1.split("")
   str2_arr = str2.split("")
   indexes = []
   
   str1_arr.each_with_index do |char , i|
        unless str2_arr.find_index(char).nil?
            indexes << str2_arr.find_index(char)
            str2_arr.delete_at(indexes[-1])
        end
    end

    indexes.length == str1_arr.length && str2_arr.empty?

end



# p second_anagram?("gizmo", "sally")    #=> false
# p second_anagram?("elvis", "lives")    #=> true
# p second_anagram?("elvis", "livessssss")    #=> false



# Write a method #third_anagram? that solves the problem by sorting both strings 
# alphabetically. The strings are then anagrams if and only if the sorted versions 
# are the identical.

# What is the time complexity of this solution? Is it better or worse than 
# #second_anagram??

def third_anagram?(str1, str2) 
    str1.split("").sort == str2.split("").sort 
end


# p third_anagram?("gizmo", "sally")    #=> false
# p third_anagram?("elvis", "lives")    #=> true
# p third_anagram?("elvis", "livessssss")    #=> false

def fourth_anagram?(str1, str2) 
    hash1 = Hash.new(0) 
    hash2 = Hash.new(0) 

    str1.split("").each {|char| hash1[char] += 1}
    str2.split("").each {|char| hash2[char] += 1}

    hash1 == hash2 
end


# p fourth_anagram?("gizmo", "sally")    #=> false
# p fourth_anagram?("elvis", "lives")    #=> true
# p fourth_anagram?("elvis", "livessssss")    #=> false

def fourth_anagram?(str1, str2)
    hash = Hash.new(0) 

    str1.split("").each {|char| hash[char] += 1}
    str2.split("").each {|char| hash[char] -= 1}

    hash.all?{ |k, v| v == 0}
end


p fourth_anagram?("gizmo", "sally")    #=> false
p fourth_anagram?("elvis", "lives")    #=> true
p fourth_anagram?("elvis", "livessssss")    #=> false