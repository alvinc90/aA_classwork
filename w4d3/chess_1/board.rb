require_relative "./piece.rb"
require_relative "./null_piece.rb"

class Board  
    attr_accessor :board
    def initialize 
        @board = Array.new(8) {Array.new(8)} 
        @sentinel = NullPiece.instance
    end

    def [](pos) 
        row = pos[0] 
        col = pos[1] 
        @board[row][col] 
    end

    def []=(pos, piece)
        row = pos[0]
        col = pos[1]
        @board[row][col] = piece
    end
    
    def valid_pos?(pos) 
        pos.all?{|ele| ele >= 0 && ele < 8}
    end

    def empty?(pos)
        self[pos].is_a?(NullPiece)
    end

    # b = Board.new
    # b[0,0] >= some_piece
    # b[1,1] >= NullPiece
    # b.move_piece([0,0], [1,1])
    def move_piece(start_pos, end_pos)
        raise "empty piece" if self.empty?(start_pos)
        raise "position is out of bound" unless valid_pos?(end_pos) 
        raise "invalid move" unless self.empty?(end_pos) 
        if empty?(end_pos)
            self[end_pos] = self[start_pos] 
            self[start_pos] = @sentinel
        end
    end
    
    def add_piece(piece, pos)
        self[pos] = piece
    end

    def checkmate?(color)

    end


    private 
    attr_reader :sentinel 
end


    