# SQUARE
class Square
  attr_accessor :color, :element

  def initialize
    @element = " "
  end

  def empty?
    piece.nil?
  end

  def contains_piece?
    element.is_a?(Piece)
  end

  def to_s
    return element.unicode if contains_piece?

    element
  end
end
