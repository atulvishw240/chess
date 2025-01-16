require_relative "mod_utils"
# BOARD
class Board
  include Utils

  RESET_TERMINAL = " \e[0m".freeze
  DARK_YELLOW_FOREGROUND = "\e[1;33m".freeze
  BLACK_FOREGROUND = "\e[30m".freeze
  WHITE_FOREGROUND = "\e[37m".freeze
  WHITE_BACKGROUND = "\e[47m".freeze
  CYAN_BACKGROUND = "\e[48;5;45m".freeze

  attr_accessor :board, :white_pieces, :black_pieces

  def initialize
    # Ignore 0 based index for simplicity
    @board = Array.new(9) { Array.new(9, " ") }
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

  def update(rank, file, piece)
    board[rank][file] = piece
  end

  #----------------------------------------ALL PRIVATE METHODS ARE BELOW-------------------------------------------
  private

  def print_chess_square(row_index, col_index)
    if sum(row_index, col_index).even?
      print_white_square(row_index, col_index)
    else
      print_blue_square(row_index, col_index)
    end
  end

  def sum(row_index, col_index)
    row_index + col_index
  end

  def print_white_square(row_index, col_index)
    element = element_to_s(row_index, col_index)
    print WHITE_BACKGROUND + element + RESET_TERMINAL
  end

  def print_blue_square(row_index, col_index)
    element = element_to_s(row_index, col_index)
    print CYAN_BACKGROUND + element + RESET_TERMINAL
  end

  def element_to_s(row_index, col_index)
    element = board[row_index][col_index]
    return element.unicode if a_piece?(element)

    element
  end

  def a_piece?(element)
    element.class < Piece
  end

  def print_ranks(row_index)
    rank = 9 - row_index
    print DARK_YELLOW_FOREGROUND + rank.to_s + inline_space(1) + RESET_TERMINAL
  end

  def print_files
    files = "a b c d e f g h"
    puts DARK_YELLOW_FOREGROUND + inline_space(3) + files + RESET_TERMINAL
  end

  def inline_space(number)
    spaces = ""
    number.times do
      spaces += " "
    end

    spaces
  end
end
