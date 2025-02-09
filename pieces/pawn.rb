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
  # For BLACK pawn moves : we'll have to do +1 to row_index
  # For BROWN pawn moves: we'll have to do -1 from row_index
  # Pawn moves straight, only if they aren't blocked by other pieces.
  # It can move either 1 step or 2 steps depending on where it is on the board.
  #   1. If it's at start then it can move either 2 steps or 1 step.
  #   2. If it's at any other place then it can move only 1 step.

  def move
    row_index = position[0]
    col_index = position[1]

    if color == BLACK_FOREGROUND
      row_index += 1
    else
      row_index -= 1
    end

    move = [row_index, col_index]

    square = board.get_square(move[0], move[1])
    return position if square.contains_piece?

    update_position(move)
    move
  end

  def start
    color == BLACK_FOREGROUND ? 2 : 7
  end

  def at_start?
    row_index = position[0]
    return true if row_index == start

    false
  end

  def move_two_steps
    moves = []
    return [] unless at_start?

    moves << move
    moves << move
  end

  def capture
    row_index = position[0]
    col_index = position[1]

    # Move black_or_brown does the same thing
    if color == BLACK_FOREGROUND
      row_index += 1
    else
      row_index -= 1
    end

    move1 = [row_index, col_index + 1]
    move2 = [row_index, col_index - 1]
    square1 = board.get_square(move1[0], move1[1])
    square2 = board.get_square(move2[0], move2[1])

    if square1.contains_piece?
      piece = square1.element
      return move1 unless color == piece.color
    end

    return unless square2.contains_piece?

    piece = square2.element
    move2 unless color == piece.color
  end
end
