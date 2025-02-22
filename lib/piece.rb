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

  def possible_actions
    moves = all_possible_moves

    # Update board with markers and captures
    moves.each do |move|
      update_marker_and_capture(move)
    end

    board.display

    # Clean markers and captures
    moves.each do |move|
      clean_marker_and_capture(move)
    end

    # Return possible moves for 'Piece'
    moves
  end

  def to_s
    "#{color}#{unicode}"
  end

  #------------------------------ALL PRIVATE METHODS ARE BELOW---------------------------
  private

  def update_position(position)
    self.position = position
  end

  def update_marker_and_capture(move)
    square = board.get_square(move[0], move[1])
    if square.contains_piece?
      square.color = PURPLE_BACKGROUND
    else
      board.update(move[0], move[1], MARKER)
    end
  end

  def clean_marker_and_capture(move)
    square = board.get_square(move[0], move[1])
    if square.contains_piece?
      square.color = nil
    else
      board.update(move[0], move[1], " ")
    end
  end
end
