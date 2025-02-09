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

  def all_possible_moves
    row_index = position[0]
    col_index = position[1]

    moves = march_forward(row_index, col_index)
    captures = capture(row_index, col_index)
  end

  def march_forward(row_index, col_index)
    if at_start?
      two_steps(row_index, col_index)
    else
      one_step(row_index, col_index)
    end
  end

  def capture(row_index, col_index)
    row_index = forward(row_index)

    moves = []
    moves << [row_index, col_index + 1]
    moves << [row_index, col_index - 1]

    moves.filter! do |move|
      square = board.get_square(move[0], move[1])
      if square.contains_piece?
        piece = square.element
        color != piece.color
      end
    end
  end

  def at_start?
    row_index = position[0]
    return true if row_index == start

    false
  end

  def start
    color == BLACK_FOREGROUND ? 2 : 7
  end

  def one_step(row_index, col_index)
    row_index = forward(row_index)
    move = [row_index, col_index]
    square = board.get_square(move[0], move[1])

    return [] if square.contains_piece?

    move
  end

  def two_steps(row_index, col_index)
    return [] unless at_start?

    moves = []
    2.times do
      moves << one_step(row_index, col_index)
      row_index = forward(row_index)
    end

    moves
  end

  def forward(row_index)
    if color == BLACK_FOREGROUND
      row_index += 1
    else
      row_index -= 1
    end

    row_index
  end
end
