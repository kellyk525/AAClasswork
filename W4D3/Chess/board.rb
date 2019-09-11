require_relative "piece"
require_relative "king"
require_relative "queen"
require_relative "bishop"
require_relative "knight"
require_relative "rook"


class Board
  attr_reader :board

  def initialize
    @board = Array.new(8) { Array.new(8)}
    board_set
  end

  def board_set
    @board.each_with_index do |row, i|
      row.each_with_index do |ele, j|
        if i == 0 || i == 1 || i == 6 || i == 7  
          board[i][j] = Piece.new([i,j])
        else
          board[i][j] = "😈"
        end
      end
    end
    @board[0][4] = King.new([0,4])
    @board[7][4] = King.new([7,4])
    @board[0][3] = Queen.new([0,3])
    @board[7][3] = Queen.new([7,3])
    @board[0][2] = Bishop.new([0,2])
    @board[7][2] = Bishop.new([7,2])
    @board[0][5] = Bishop.new([0,5])
    @board[7][5] = Bishop.new([7,5])
    @board[0][1] = Knight.new([0,1])
    @board[7][1] = Knight.new([7,1])
    @board[0][6] = Knight.new([0,6])
    @board[7][6] = Knight.new([7,6])
    @board[0][0] = Rook.new([0,0])
    @board[7][0] = Rook.new([7,0])
    @board[7][7] = Rook.new([7,7])
    @board[0][7] = Rook.new([0,7])
  end

  def print
    @board.each_with_index do |row, i|
      if i == 0 || i == 1 || i == 6 || i == 7  
        final = row.map {|piece_inst| piece_inst.value}
        p final.join(" ")
      else
        p row.join(" ")
      end
    end
  end

  def play
    puts "Enter a Player"
    player = gets.chomp
    puts "Enter a position on the grid from 0 to 7 Ex. 0 7"
    next_position = gets.chomp.split(" ").map(&:to_i)
    r, c = next_position
    piece = @board[r][c]
    piece.starting_pos = [r, c]
  end

end

board = Board.new
board.print
p board.board[1][2].starting_pos


  # def board_set
    
  #   pawns = Array.new(8, Piece.new(@board))
  #   pawns_values = pawns.map! {|ele| ele.value }
  #   @board[1] = pawns
  #   @board[6] = pawns
  #   @board[0] = ["R", "F", "B", "Q", "K", "B", "F", "R"]
  #   @board[7] = ["R", "F", "B", "Q", "K", "B", "F", "R"]
  # end

  # def [](pos)
  #   row, col = pos
  #   @board[row][col]
  # end

  # def []=(pos, val)
  #   row, col = pos
  #   @board[row][col] = val
  # end
