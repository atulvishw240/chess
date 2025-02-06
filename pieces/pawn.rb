require_relative "../lib/piece"
require_relative "../lib/modules/mod_colorable"
require_relative "../lib/board"
# PAWN
class Pawn < Piece
  include Colorable

  attr_accessor :start

  def initialize(color)
    @unicode = "\u{265F}"
    super
  end

  # PAWN MOVES
  # Pawn moves straight, only if they aren't blocked by other pieces.
  # It can move either 1 step or 2 steps depending on where it is on the board.
  #   1. If it's at start then it can move either 2 steps or 1 step.
  #   2. If it's at any other place then it can move only 1 step.

  def move
    position[0] = position[0] + 1
  end
end

pawn = Pawn.new("P")
pawn.position = [1, 2]
pawn.move
pawn.move
pawn.move
p pawn.position
