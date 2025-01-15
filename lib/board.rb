require_relative "mod_utils"
# BOARD
class Board
  include Utils

  RESET_TERMINAL = "\e[0m".freeze
  WHITE = "\e[47m".freeze
  # BRIGHT_CYAN = "\e[106m".freeze
  BRIGHT_CYAN = "\e[48;5;62m".freeze
  DARK_YELLOW = "\e[1;33m".freeze

  attr_accessor :board

  def initialize
    # Ignore 0 based index for simplicity
    @board = Array.new(9) { Array.new(9, "  ") }
  end

  def print_board
    board[1..8].each_with_index do |row, row_index|
      rank = 8 - row_index
      print DARK_YELLOW + rank.to_s + inline_space(1) + RESET_TERMINAL

      row[1..8].each_index do |col_index|
        print_chess_square(row_index, col_index)
      end

      puts "\n"
    end

    print_files
  end

  def update_board(file, rank, piece)
    row_index = file_to_int(file)
    col_index = rank.to_i

    board[row_index][col_index] = piece
  end

  #----------------------------------------ALL PRIVATE METHODS ARE BELOW-------------------------------------------
  private

  def print_chess_square(row_index, col_index)
    if sum(row_index, col_index).even?
      print_cyan_square(row_index, col_index)
    else
      print_white_square(row_index, col_index)
    end
  end

  def print_white_square(row_index, col_index)
    element = board[row_index][col_index]
    print WHITE + element + RESET_TERMINAL
  end

  def print_cyan_square(row_index, col_index)
    element = board[row_index][col_index]
    print BRIGHT_CYAN + element + RESET_TERMINAL
  end

  def print_files
    files = "a b c d e f g h"
    puts DARK_YELLOW + inline_space(2) + files + RESET_TERMINAL
  end

  def inline_space(number)
    spaces = ""
    number.times do
      spaces += " "
    end

    spaces
  end

  def sum(row_index, col_index)
    row_index + col_index
  end
end
