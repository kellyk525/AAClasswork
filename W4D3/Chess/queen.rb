require_relative "piece"

class Queen < Piece
  attr_reader :value
  def initialize(pos)
    super(pos)
    @value = "♕"
  end
end
