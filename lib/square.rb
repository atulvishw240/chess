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
    piece.class < Piece
  end

  def assign_color(row_index, col_index, color)
    self.color = color
  end
end
