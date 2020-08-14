require 'byebug'
class PolyTreeNode

    attr_reader :parent, :children, :value 

    def initialize(value) 
        @children = []
        @value = value 
        @parent = nil 
    end

    def parent=(node) 
        if parent != nil
            parent.children.delete(self)
        end    
            @parent = node    
        if parent != nil 
            node.children << self
        end    
    end

    def add_child(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        #if child_nodes parent == nil raise error
        #child_node parent == nil
        if !self.children.include?(child_node) 
            raise error 
        end
        child_node.parent = nil 
       
    end        

    def dfs(target_value) #c
        # self(node) children(array) [a,b,c,d,e,f]
        # debugger
        return self if self.value == target_value #a
        
        self.children.each do |child| #b #c
          current_child = child.dfs(target_value)  
          return current_child unless current_child == nil
        end  
        return nil
    end

    def bfs(target_value)
        arr = [self]
        until arr.empty?
            current_node = arr.shift 
            return current_node if current_node.value == target_value
            current_node.children.each do |child|
                arr << child
            end    
        end  
        return nil  
    end    
end