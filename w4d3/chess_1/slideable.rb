require_relative "./board.rb" 
require_relative "./slideable.rb"
require_relative "./piece.rb"

module Slideable 
    HORIZONTAL_DIRS = [[-1, 0], [1, 0], [0, 1], [0, -1]]  
    DIAGONAL_DIR = [[1, 1] [-1, -1], [-1, 1], [1, -1]] 
    
    def horizontal_dirs 
        HORIZONTAL_DIRS
    end

    def diagonal_dirs 
        DIAGONAL_DIR
    end

    def moves 
        #need an empty array 
        # possible_moves = [[0,1], [0,2], [0,7]] 
        #call board#valid_pos?(pos)
        #call board#empty?(pos) 
        # try using @board to call board method 
        # self.pos.each do |i| 
        #     possible_moves << valid_pos(@board[i + 1][i + 1]) 
        # end 
        
        valid_moves = [] 
        # row = self.pos[0]
        # col = self.pos[1] 

        self.move_dirs.each do |move| 
            # new_row = row + move[0] 
            # new_col = col + move[1] 
            # new_pos = [new_row, new_col] 
            # if valid_pos?(new_pos) && empty?(new_pos) 
            #     valid_moves << new_pos  
            # end
            valid_moves += grow_unblocked_moves_in_dir(move[0], move[1])
        end
        valid_moves
    end

    private 
    # def move_dirs 
    #     ##heeeerrreeeeeeeeeeeeeeeeeeeeeeeeeeeeee##
    # end

    def grow_unblocked_moves_in_dir(dx, dy)
        finished = false
        new_arr = []
        while !finished
            finished = true
            curr_x = self.pos[0] + dx 
            curr_y = self.pos[1] + dy
            curr_pos = [curr_x,curr_y]
            if self.board.valid_pos?(curr_pos) && self.board.empty?(curr_pos)
                new_arr << curr_pos
                finished = false
            end
        end
        new_arr
    end

end