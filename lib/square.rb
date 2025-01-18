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
end
