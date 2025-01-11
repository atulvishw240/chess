require_relative "piece"
# PAWN
class Pawn < Piece
  def move
    self.rank = rank + 1
  end
end
