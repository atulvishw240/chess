require_relative "piece"
# PAWN
class Pawn < Piece
  def initialize(color)
    @unicode = "\u{265F}"
    super
  end

  def move
    self.rank = rank + 1
  end
end
