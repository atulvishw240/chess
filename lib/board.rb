require_relative "mod_utils"
require_relative "square"
require_relative "pieces_set"
# BOARD
class Board
  include Utils

  RESET_TERMINAL = "\e[0m".freeze
  DARK_YELLOW_FOREGROUND = "\e[1;33m".freeze
  BLACK_FOREGROUND = "\e[30m".freeze
  WHITE_FOREGROUND = "\e[37m".freeze
  BROWN_FOREGROUND = "\e[38;5;160m".freeze
  WHITE_BACKGROUND = "\e[47m".freeze
  CYAN_BACKGROUND = "\e[48;5;45m".freeze
  MARKER = "\e[90m\u{25CF}".freeze

  attr_accessor :board, :black, :purple

  def initialize
    # Ignore 0 based index for simplicity
    @black = SetOfPieces.new(BLACK_FOREGROUND)
    @purple = SetOfPieces.new(BROWN_FOREGROUND)
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

  def update(row_index, col_index, piece_or_marker)
    square = get_square(row_index, col_index)
    square.element = piece_or_marker
  end

  #----------------------------------------ALL PRIVATE METHODS ARE BELOW-------------------------------------------
  # private

  def print_chess_square(row_index, col_index)
    square = get_square(row_index, col_index)
    sum = sum(row_index, col_index)

    assign_color_to_square(square, sum)
    print "#{square.color} #{square} #{RESET_TERMINAL}"
  end

  def get_square(row_index, col_index)
    board[row_index][col_index]
  end

  def sum(row_index, col_index)
    row_index + col_index
  end

  def assign_color_to_square(square, sum)
    return unless square.color.nil?

    background = sum.even? ? WHITE_BACKGROUND : CYAN_BACKGROUND
    square.color = background
  end

  def print_ranks(rank)
    print DARK_YELLOW_FOREGROUND + rank.to_s + inline_space(1) + RESET_TERMINAL
  end

  def print_files
    files = "a  b  c  d  e  f  g  h"
    puts DARK_YELLOW_FOREGROUND + inline_space(3) + files + RESET_TERMINAL
  end

  def inline_space(number)
    spaces = ""
    number.times do
      spaces += " "
    end

    spaces
  end

  def setup_board
    setup_pieces(black.pieces, 8)
    setup_pieces(black.pawns, 7)
    setup_pieces(purple.pieces, 1)
    setup_pieces(purple.pawns, 2)

    display
  end

  def setup_pieces(pieces, rank)
    pieces.each_with_index do |piece, index|
      file = index
      update(rank, file, piece)
    end
  end
end
