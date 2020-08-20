require_relative "./board.rb" 
require_relative "./slideable.rb"
require_relative "./piece.rb"
class Rook < Piece
    include Slideable
    def initialize(symbol, board, pos)
        super
    end

    def move_dirs
        horizontal_dirs
    end
end

b = Board.new
r = Rook.new(:white,b,[0,0])
p r.moves