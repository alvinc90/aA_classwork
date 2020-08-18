require_relative "00_tree_node.rb"
require "byebug"
class KnightPathFinder
    attr_reader :starting_pos, :path, :root_node
    attr_accessor :considered_positions


    def initialize(starting_pos)
        # @starting_pos = [0,0] #[[0,0]]
        @considered_positions = [starting_pos] 
        @root_node = PolyTreeNode.new(starting_pos)
        build_move_tree
    end    

    def find_path(final_pos)
        @path << final_pos
    end  
    
    def build_move_tree
        # debugger
        queue = [@root_node]

        until queue.empty?
            
            current_node = queue.shift
            new_move_positions(current_node.value).each do |el|
                current_node.add_child(PolyTreeNode.new(el))
                queue.push(PolyTreeNode.new(el))
            end    
        end     
         
    end

     
    def self.valid_moves(pos) 
        #the numbers must be within the range of board size 
        #return an array #pos = [3,3]
        possible_moves = [[1,2], [1,-2], [2,1], [2,-1], [-1,2], [-1,-2], [-2,1], [-2,-1]]
        v_moves = [] 
        # debugger
        row = pos[0] #[1]
        col = pos[1] #[1] 
        possible_moves.each do |move| #[1,2]
            new_row = row + move[0] #[2]
            new_col = col + move[1] #[3] 
            # debugger 
            new_pos = [new_row, new_col] #[2,3] 
            if (0..7).to_a.include?(new_row) && (0..7).to_a.include?(new_col) 
                v_moves << new_pos 
            end
        end
        v_moves 
    end

    def new_move_positions(pos) 
        arr = KnightPathFinder.valid_moves(pos).select { |el| !@considered_positions.include?(el)}
        arr.each {|pos| @considered_positions << pos}
        arr
    end

    def find_path(end_pos)
        # debugger
        @root_node.dfs(end_pos)

    end

    def trace_path_back(last_node) 
        results = [last_node.value] 

        while last_node.parent
            find_path(results.last).each do |nodes|
                results << nodes.parent 
            end
        end    
        results     
    end

#     def trace_path_back(target_node)
#     tmp = target_node
#     path = [tmp.value]
#     while tmp.parent
#       tmp = tmp.parent
#       path.unshift(tmp.value)
#     end
#     path
#   end


end  

# KnightPathFinder.valid_moves([1,1]) 
k = KnightPathFinder.new([0,0]) 
# p k.considered_positions.length
# p k.new_move_positions([0,3])
# p k.build_move_tree
# p k.find_path([2,1]) 
p k.trace_path_back([3,2]) 
