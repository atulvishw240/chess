require_relative "../lib/piece"
# PAWN
class Pawn < Piece
  def initialize(color)
    @unicode = "\u{265F}"
    super
  end
end
