require_relative "../lib/piece"
require_relative "../lib/modules/mod_straight"

# ROOK
class Rook < Piece
  include Straight

  def initialize(color)
    @unicode = "\u{265C}"
    super
  end

  def all_possible_moves
    rook_moves
  end
end
