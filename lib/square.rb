# SQUARE
class Square
  attr_accessor :color, :element

  def initialize
    @element = " "
  end

  def empty?
    piece.nil?
  end

  def contains?(piece)
    element.is_a?(Piece)
  end

  def assign_color(color)
    self.color = color
  end

  def to_s
    piece = element
    return piece.unicode if contains?(piece)

    element
  end
end
