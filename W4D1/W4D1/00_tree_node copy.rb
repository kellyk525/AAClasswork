require "byebug"
class PolyTreeNode

    attr_reader :children, :parent
    attr_accessor :value
    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(parent_node)
        if parent 
            self.parent.children.delete(self)
        end
        @parent = parent_node
        parent_node.children << self unless @parent.nil?
    end

    def add_child(child)
        # debugger
        child.parent = self
    end
    
    def remove_child(child)    
      if child.parent
        child.parent = nil
      else
        raise "has no parent"
      end
    end

    def dfs(target)
        return self if value == target
        children.each do |child|
            result = child.dfs(target)
            return result unless result.nil?
        end
        nil
    end

    def bfs(target)
        queue = [self]

        until queue.empty?
            node = queue.shift
            return node if node.value == target
            queue += node.children
        end
        nil
    end
end