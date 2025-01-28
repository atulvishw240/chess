require_relative "modules/mod_colorable"

# Piece
class Piece
  include Colorable

  attr_accessor :color, :row, :col
  attr_reader :unicode

  def initialize(color)
    @color = color
  end

  def move; end
  def all_possible_moves(board); end

  # Exclude squares which has a piece from all_possible_moves
  def useful_moves(board)
    moves = all_possible_moves(board)
    moves.select do |move|
      row_index = move[0]
      col_index = move[1]

      square = board.get_square(row_index, col_index)
      square.empty?
    end
  end

  def update_position(row_index, col_index)
    self.row = row_index
    self.col = col_index
  end

  def all_possible_captures(board, moves)
    moves.select do |move|
      capture?(board, move)
    end
  end

  def display_possible_actions(board, moves, captures)
    display_markers(board, moves)
    display_captures(board, captures)
  end

  #------------------------------ALL PRIVATE METHODS ARE BELOW---------------------------
  private

  def display_markers(board, moves)
    moves.each do |move|
      row_index = move[0]
      col_index = move[1]

      board.update(row_index, col_index, MARKER)
    end
  end

  def display_captures(board, captures)
    captures.each do |capture|
      row_index = capture[0]
      col_index = capture[1]

      square = board.get_square(row_index, col_index)
      square.color = PURPLE_BACKGROUND
    end
  end

  def capture?(board, move)
    row_index = move[0]
    col_index = move[1]
    square = board.get_square(row_index, col_index)

    if square.contains_piece?
      piece = square.element
      true unless piece.color == color
    else
      false
    end
  end

  public

  def clean_markers_and_captures(board, moves, captures)
    clean_markers(board, moves)
    clean_captures(board, captures)
  end

  def clean_markers(board, markers)
    markers.each do |marker|
      row_index = marker[0]
      col_index = marker[1]

      square = board.get_square(row_index, col_index)
      square.element = " "
    end
  end

  def clean_captures(board, captures)
    captures.each do |capture|
      row_index = capture[0]
      col_index = capture[1]

      square = board.get_square(row_index, col_index)
      square.color = nil
    end
  end

  def to_s
    "#{self.class} at row-index: #{row_index} and col-index: #{col_index}"
  end
end
