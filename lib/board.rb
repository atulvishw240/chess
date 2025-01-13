# BOARD
class Board
  WHITE = "\e[47m \e[0m".freeze
  CYAN = "\e[46m \e[0m".freeze

  attr_accessor :board

  def initialize
    @board = Array.new(8) { Array.new(8) } # 10 for simplicity
  end

  def print_board
    board.each_with_index do |row, row_index|
      row.each_index do |col_index|
        print_chess_square(row_index, col_index)
      end

      puts "\n"
    end
  end

  #----------------------------------------ALL PRIVATE METHODS ARE BELOW----------------------------------
  private

  def print_chess_square(row_index, col_index)
    if sum(row_index, col_index).even?
      print_cyan_square
    else
      print_white_square
    end
  end

  def print_white_square
    print WHITE + WHITE
  end

  def print_cyan_square
    print CYAN + CYAN
  end

  def sum(row_index, col_index)
    row_index + col_index
  end
end

board = Board.new
board.print_board
