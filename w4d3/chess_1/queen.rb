require_relative "./board.rb" 
require_relative "./slideable.rb"
require_relative "./piece.rb"
class Queen < Piece
    include Slideable 
    
    def initialize(symbol, board, pos)
        super
    end

    def move_dirs
        horizontal_dirs.moves
    end
end
# b=Board.new
# q = Queen.new(:white,b,[0,0])
# p q.moves 