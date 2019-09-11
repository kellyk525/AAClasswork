require_relative "piece"

class Rook < Piece
  attr_reader :value
  def initialize(pos)
    super(pos)
    @value = "♖"
  end

  def valid_moves(end_pos)
    valid_pos?(end_pos)
    if r1 == r2 && c1 != c2 || r1 != r2 && c1 == c2
      new_move = [r2, c2]
    end
  end
end


  MOVES = [
    [0, -1],
    [-1, -1],
    [1,1],
    [1,0],
    [-1, 0],
    [-1, 1],
    [0, 1],
    [1, -1],
  ]