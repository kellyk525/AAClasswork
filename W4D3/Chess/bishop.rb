require_relative "piece"

class Bishop < Piece
  attr_reader :value
  def initialize(pos)
    super(pos)
    @value = "♝"
  end
end











# class Bishop
#   MOVES = []  # # both row and col, have to decrement or increment the same value within the grid

#   def valid_moves
    
#   end

#   def [](end_pos)
#     row, column = end_pos
#     @board[row][column]
#   end
# end