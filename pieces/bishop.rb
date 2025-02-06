require_relative "../lib/piece"
require_relative "../lib/modules/mod_diagonal"

# BISHOP
class Bishop < Piece
  include Diagonal

  def initialize(color)
    @unicode = "\u{265D}"
    super
  end

  def all_possible_moves
    bishop_moves
  end
end
