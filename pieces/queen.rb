require_relative "../lib/piece"
require_relative "../lib/modules/mod_straight"
require_relative "../lib/modules/mod_diagonal"
require_relative "../lib/board"

# QUEEN
class Queen < Piece
  include Straight
  include Diagonal

  def initialize(color)
    @unicode = "\u{265B}"
    super
  end

  def all_possible_moves
    straight = rook_moves
    diagonal = bishop_moves
    straight.concat(diagonal)
  end
end

board = Board.new
queen = Queen.new("Q")
queen.position = [4, 5]
queen.board = board

p queen.all_possible_moves
