

class Piece
  attr_reader :starting_pos, :value
  def initialize(pos)
    @value = "♟"
    @starting_pos = pos
  end
end



#   def empty?
#     row, column = pos
#     @board[row][column].empty?
#   end

#   def valid_moves
    
#   end

#   def pos=(val)
#     row, column = pos
#     @board[row][column] = val
#   end

#   def symbol
#     @color
#   end

#   private

#   def move_into_check?(end_pos)
#     valid_move?(end_pos)
#     move_piece!(color, starting_pos, ending_pos)
#   end

#   def move_piece!(color, starting_pos, ending_pos)
#     @grid[starting_pos] = nil
#     @grid[end_pos] = # piece... 
#     @starting_pos = end_pos   
#   end

#   def valid_move?(end_pos)
#     r1, c1 = starting_pos
#     r2, c2 = ending_pos
#     new_row_move = r2 - r1
#     new_column_move = c2 - c1
#     move = [new_row_move, new_column_move]
#     self.MOVES.include?(new_move)
#   end

#     # have to check if the position given is in the grid
#     # have to check if it is a valid move of the piece (contained in "Moves")

#   def valid_pos?(end_pos)
#     inside = [0..7].to_a
#     row, column = end_pos
#     return false if !inside.include?(row) || !inside.include?(col)
#     #check if it is in the grid
#     @board[row][column] == nil
#     #check if it is empty
#   end

# # def run
# #   Board.new
# # end

# # start = board.run --> will create the new grid "object" and pass this around

# # knight1 = Piece.new("white", start, [1,2])