require_relative "piece"
# SQUARE
class Square
  attr_accessor :color, :element

  def initialize
    @element = " "
  end

  def empty?
    element == " "
  end

  def contains_piece?
    element.is_a?(Piece)
  end

  def to_s
    return element.to_s if contains_piece?

    element
  end
end
