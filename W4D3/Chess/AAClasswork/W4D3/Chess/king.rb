require_relative "piece"

class King < Piece
  attr_reader :value
  def initialize(pos)
    super(pos)
    @value = "♔"
  end
end

king = King.new([1,2])
p king