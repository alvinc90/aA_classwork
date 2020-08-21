require "byebug"
class Board
    attr_reader :num_pieces, :hanoi, :left_array

    def initialize(num_pieces)
        @num_pieces = num_pieces
        left_array = (1..num_pieces).to_a
        @hanoi = [left_array, [], []]
    end

    def move(input)
        # input = gets.chomp.to_i 
        x, y = input 
        raise "You can't move from an empty tower" if hanoi[x].empty? 
        debugger
        raise "You can't move a smaller value onto a larger value" if hanoi[x][0] > hanoi[y][0] 
        top = hanoi[x].shift 
        hanoi[y].unshift(top)
        hanoi 
    end

    def won? 
        hanoi.each do |row|

        end
    end

end


