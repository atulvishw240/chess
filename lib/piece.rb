require_relative "modules/mod_colorable"

# Piece
class Piece
  include Colorable

  attr_accessor :color, :position, :board
  attr_reader :unicode

  def initialize(color)
    @color = color
  end

  def all_possible_moves; end

  def move(coordinates)
    # Update where your piece was with " "
    square = board.get_square(position[0], position[1])
    square.element = " "

    # Update your piece new coordinates
    update_position(coordinates)
  end

  def all_possible_captures(moves)
    moves.select do |move|
      capture?(move)
    end
  end

  def display_markers_and_captures(moves, captures)
    display_markers(moves)
    display_captures(captures)
    board.display

    clear_markers_and_captures(moves, captures)
  end

  def to_s
    "#{color}#{unicode}"
  end

  #------------------------------ALL PRIVATE METHODS ARE BELOW---------------------------
  private

  def update_position(position)
    self.position = position
  end

  def capture?(move)
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

  def display_markers(moves)
    moves.each do |move|
      row_index = move[0]
      col_index = move[1]

      # Don't display markers over potential captures
      square = board.get_square(row_index, col_index)
      next if square.contains_piece?

      board.update(row_index, col_index, MARKER)
    end
  end

  def display_captures(captures)
    captures.each do |capture|
      row_index = capture[0]
      col_index = capture[1]

      square = board.get_square(row_index, col_index)
      square.color = PURPLE_BACKGROUND
    end
  end

  def clear_markers_and_captures(moves, captures)
    clean_markers(moves)
    clean_captures(captures)
  end

  def clean_markers(markers)
    markers.each do |marker|
      row_index = marker[0]
      col_index = marker[1]

      square = board.get_square(row_index, col_index)
      square.element = " "
    end
  end

  def clean_captures(captures)
    captures.each do |capture|
      row_index = capture[0]
      col_index = capture[1]

      square = board.get_square(row_index, col_index)
      square.color = nil
    end
  end
end
