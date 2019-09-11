
require_relative "piece"

class Knight < Piece
  attr_reader :value
  def initialize(pos)
    super(pos)
    @value = "♘"
  end
end
