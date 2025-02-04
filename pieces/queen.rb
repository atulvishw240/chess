require_relative "../lib/piece"
require_relative "../lib/modules/mod_utils"

# QUEEN
class Queen < Piece
  include Utils

  def initialize(color)
    @unicode = "\u{265B}"
    super
  end

  def all_possible_moves
  end
end
