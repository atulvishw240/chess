require_relative "modules/mod_utils"
require_relative "modules/mod_colorable"
require_relative "pieces_set"
require_relative "square"

# BOARD
class Board # rubocop:disable Metrics/ClassLength
  include Utils
  include Colorable

  attr_accessor :board, :black, :brown, :markers, :captures

  def initialize
    # Ignore 0 based index for simplicity
    @board = Array.new(9) { Array.new(9) { Square.new } }
    @black = SetOfPieces.new(BLACK_FOREGROUND)
    @brown = SetOfPieces.new(BROWN_FOREGROUND)

    @markers = []
    @captures = []
    setup
  end

  def display
    update_state(black.set, brown.set)
    update_with_markers
    update_with_captures

    print_board
    clean_markers_and_captures
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

  def setup
    # BLACK PIECES
    assign_start_positions(black.set[0..7], 8)
    assign_start_positions(black.set[8..15], 4)

    # BROWN PIECES
    assign_start_positions(brown.set[0..7], 1)
    assign_start_positions(brown.set[8..15], 3)
  end

  def assign_start_positions(pieces, row_index)
    pieces.each_with_index do |piece, col_index|
      # col_index + 1 to offset our index to 1th index based Board
      piece.update_position(row_index, col_index + 1)
    end
  end

  def update_state(black, brown)
    update_with_pieces(black)
    update_with_pieces(brown)
  end

  def update_with_pieces(pieces)
    pieces.each do |piece|
      row_index = piece.row
      col_index = piece.col

      update(row_index, col_index, piece)
    end
  end

  def update_with_markers
    return if markers.empty?

    markers.each do |position|
      row_index = position[0]
      col_index = position[1]

      square = get_square(row_index, col_index)
      update(row_index, col_index, MARKER) unless square.contains_piece?
    end
  end

  def update_with_captures
    return if captures.empty?

    captures.each do |position|
      row_index = position[0]
      col_index = position[1]

      square = get_square(row_index, col_index)
      square.color = PURPLE_BACKGROUND
    end
  end

  def print_board
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

  def print_ranks(rank)
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

  def clean_markers_and_captures
    clean(markers)
    clean(captures)

    self.markers = []
    self.captures = []
  end

  def clean(markers_or_captures)
    markers_or_captures.each do |marker_or_capture|
      row_index = marker_or_capture[0]
      col_index = marker_or_capture[1]

      update(row_index, col_index, " ")
    end
  end
end
