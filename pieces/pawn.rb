require_relative "../lib/piece"
require_relative "../lib/modules/mod_colorable"
require_relative "../lib/board"
require_relative "../pieces/bishop"
# PAWN
class Pawn < Piece
  include Colorable

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
    row_index = position[0]
    col_index = position[1]
    move = [row_index + 1, col_index]
    square = board.get_square(move[0], move[1])

    return position if square.contains_piece?

    self.position = move
  end

  def start
    color == BLACK_FOREGROUND ? 2 : 7
  end

  def move_two_steps
    row_index = position[0]
    return unless row_index == start

    move
    move
  end
end
