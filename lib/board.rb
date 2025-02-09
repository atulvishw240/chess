require_relative "modules/mod_utils"
require_relative "modules/mod_colorable"
require_relative "square"

# BOARD
class Board
  include Utils
  include Colorable

  attr_accessor :board

  def initialize
    # Ignore 0 based index for simplicity
    @board = Array.new(9) { Array.new(9) { Square.new } }
  end

  def display
    board.each_with_index do |row, row_index|
      next if row_index.zero?

      print_ranks(row_index)

      row.each_index do |col_index|
        next if col_index.zero?

        print_chess_square(row_index, col_index)
      end

      puts "\n"
    end

    print_files
  end

  # Takes arguments : file => "a"
  #                   rank => 3
  #                   update_with => marker or piece
  def update(row_index, col_index, update_with)
    square = get_square(row_index, col_index)
    square.element = update_with
  end

  def get_square(row_index, col_index)
    board[row_index][col_index]
  end

  #----------------------------------------ALL PRIVATE METHODS ARE BELOW-------------------------------------------
  private

  def print_ranks(rank)
    # rank = 9 - rank
    print DARK_YELLOW_FOREGROUND + rank.to_s + inline_space(1) + RESET_TERMINAL
  end

  def print_chess_square(row_index, col_index)
    square = get_square(row_index, col_index)
    sum = sum(row_index, col_index)
    assign_color_to_square(square, sum)

    print "#{square.color} #{square} #{RESET_TERMINAL}"
  end

  def assign_color_to_square(square, sum)
    return unless square.color.nil?

    background = sum.even? ? WHITE_BACKGROUND : CYAN_BACKGROUND
    square.color = background
  end

  def print_files
    files = "a  b  c  d  e  f  g  h"
    puts DARK_YELLOW_FOREGROUND + inline_space(3) + files + RESET_TERMINAL
  end
end
