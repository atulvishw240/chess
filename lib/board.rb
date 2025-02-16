require_relative "modules/mod_utils"
require_relative "modules/mod_colorable"
require_relative "square"

# BOARD
class Board
  include Utils
  include Colorable

  attr_accessor :board, :black, :brown

  def initialize(black_set, brown_set)
    # Ignore 0 based index for simplicity
    @board = Array.new(9) { Array.new(9) { Square.new } }
    @black = black_set
    @brown = brown_set
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

  def update(row_index, col_index, update_with)
    square = get_square(row_index, col_index)
    square.element = update_with
  end

  def get_square(row_index, col_index)
    board[row_index][col_index]
  end

  def setup
    update_pieces_start_position(black.set[0..7])
    update_pieces_start_position(brown.set[0..7])
    update_pawns_start_position(black.set[8..15])
    update_pawns_start_position(brown.set[8..15])

    refresh
  end

  def refresh
    update_board_with_pieces(black.set)
    update_board_with_pieces(brown.set)
  end

  #----------------------------------------ALL PRIVATE METHODS ARE BELOW-------------------------------------------
  private

  def print_ranks(rank)
    rank = 9 - rank
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

  def update_pieces_start_position(pieces)
    color = pieces[0].color
    row_index = color == BLACK_FOREGROUND ? 1 : 8

    pieces.each_with_index do |piece, col_index|
      piece.position = [row_index, col_index + 1] # To offset against 1th index based Board
      piece.board = self
    end
  end

  def update_pawns_start_position(pawns)
    color = pawns[0].color
    row_index = color == BLACK_FOREGROUND ? 2 : 7

    pawns.each_with_index do |pawn, col_index|
      pawn.position = [row_index, col_index + 1]
      pawn.board = self
    end
  end

  def update_board_with_pieces(pieces)
    pieces.each do |piece|
      row_index = piece.position[0]
      col_index = piece.position[1]
      # piece.board = self

      update(row_index, col_index, piece)
    end
  end
end
