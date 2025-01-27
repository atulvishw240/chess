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
    if contains_piece?
      unicode = element.unicode
      color = element.color
      value = "#{color}#{unicode}"

      return value
    end

    element
  end
end
