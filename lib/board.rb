require_relative "modules/mod_utils"
require_relative "modules/mod_colorable"
require_relative "pieces_set"
require_relative "square"
# BOARD
class Board
  include Utils
  include Colorable

  attr_accessor :board, :black, :brown

  def initialize
    # Ignore 0 based index for simplicity
    @board = Array.new(9) { Array.new(9) { Square.new } }
    @black = SetOfPieces.new(BLACK_FOREGROUND)
    @brown = SetOfPieces.new(BROWN_FOREGROUND)
    setup
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

  #----------------------------------------ALL PRIVATE METHODS ARE BELOW-------------------------------------------
  private

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

  def print_ranks(rank)
    print DARK_YELLOW_FOREGROUND + rank.to_s + inline_space(1) + RESET_TERMINAL
  end

  def print_files
    files = "a  b  c  d  e  f  g  h"
    puts DARK_YELLOW_FOREGROUND + inline_space(3) + files + RESET_TERMINAL
  end

  # IS SE UPAR SAB SAHI HAI
  # ISKE NEECHE SE DEKHO

  def setup
    setup_pieces(black.pieces, 8)
    # setup_pieces(black.pawns, 7)

    setup_pieces(brown.pieces, 1)
    # setup_pieces(brown.pawns, 2)

    display
  end

  def setup_pieces(pieces, rank)
    pieces.each_with_index do |piece, file|
      setup_piece(rank, file + 1, piece)
    end
  end

  def setup_piece(rank, file, piece)
    update(rank, file, piece)
    piece.row_index = rank
    piece.col_index = file
  end

  def display_markers(positions)
    positions.each do |position|
      row_index = position[0]
      col_index = position[1]

      square = get_square(row_index, col_index)
      update(row_index, col_index, MARKER) unless square.contains_piece?
    end

    display
  end

  def display_captures(positions)
    positions.each do |position|
      row_index = position[0]
      col_index = position[1]

      square = get_square(row_index, col_index)
      square.color = PURPLE_BACKGROUND
    end
  end
end
