
require_relative "00_tree_node copy"

class KnightPathFinder
  attr_reader :starting_pos, :root_node
  attr_accessor :considered_positions
  MOVES = [
    [2,1],
    [-2,-1],
    [1,2],
    [-1,-2],
    [-1,2],
    [1,-2],
    [-2,1],
    [2,-1]
  ]

  def initialize (starting_pos)
    @starting_pos = starting_pos
    @considered_positions = [starting_pos]
    build_move_tree
  end

  def build_move_tree
    @root_node = PolyTreeNode.new(starting_pos)
    queue = [@root_node]
    until queue.empty?
      node = queue.shift
      new_move_positions(node.value).each do |child|
        child_node = PolyTreeNode.new(child)
        node.add_child(child_node)
        queue << child_node
      end
    end
  end

  def self.valid_moves(pos)
    x, y = pos
    valid_pos = []
    MOVES.each do |move|
      # debugger
      x1, y1 = move
      new_x = x + x1
      new_y = y + y1
      sample_pos = []
      if new_x.between?(0, 7) && new_y.between?(0, 7)
        sample_pos << new_y
        sample_pos << new_x  
      end # checking if the new position is still in the chess board
      unless sample_pos.empty?
        valid_pos << sample_pos 
      end
    end
    return valid_pos
  end

  def new_move_positions(pos)
    valid_pos = KnightPathFinder.valid_moves(pos)
    # @considered_positions += valid_pos
    new_positions = []
    valid_pos.each do |pos|
      unless @considered_positions.include?(pos)
        @considered_positions << pos
        new_positions << pos
      end
    end
    return new_positions

    #valid_pos.select { |pos| !@considered_positions.include?(pos) }
    # if KnightPathFinder.valid_moves(pos) && !@considered_positions.include?(pos)
    #   x , y = pos
    #   next_x = starting_pos[0] + x
    #   next_y = starting_pos[1] + y
    #   @considered_positions << [next_x, next_y]
    #   return [next_x, next_y]
    # end
  end

  def find_path(end_pos)
    end_node = root_node.dfs(end_pos)
    trace_path_back(end_node)
      .reverse
      .map(&:value)
  end

  def trace_path_back(end_node)
    path = []

    current_node = end_node
    until current_node.nil?
      path << current_node
      current_node = current_node.parent
    end
    path
  end

end

if $PROGRAM_NAME == __FILE__
  kpf = KnightPathFinder.new([0, 1])
  p kpf.find_path([7, 3])
end

