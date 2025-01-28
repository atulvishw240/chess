require_relative "../lib/piece"
require_relative "../lib/modules/mod_horizontal"
require_relative "../lib/modules/mod_vertical"
require_relative "../lib/modules/mod_diagonal"
require_relative "../lib/modules/mod_rev_diagonal"

# KING
class King < Piece
  include Horizontal
  include Vertical
  include Diagonal
  include ReverseDiagonal

  def initialize(color)
    @unicode = "\u{265A}"
    super
  end

  def move
  end

  #----------------------------------------ALL PRIVATE METHODS ARE BELOW-------------------------------------------

  # private
  def all_possible_moves
    moves = []
    row_index = row
    col_index = col

    moves.concat(front(board, row_index, col_index))
         .concat(back(board, row_index, col_index))
         .concat(right(board, row_index, col_index))
         .concat(left(board, row_index, col_index))
         .concat(upper_right(board, row_index, col_index))
         .concat(upper_left(board, row_index, col_index))
         .concat(lower_right(board, row_index, col_index))
         .concat(lower_left(board, row_index, col_index))
  end

  private

  def front(board, row_index, col_index)
    return [] if row_index == 8

    vertical_moves_forward(board, row_index, col_index, row_index + 1)
  end

  def back(board, row_index, col_index)
    return [] if row_index == 1

    vertical_moves_backward(board, row_index, col_index, row_index - 1)
  end

  def left(board, row_index, col_index)
    return [] if col_index == 1

    horizontal_moves_left(board, row_index, col_index, col_index - 1)
  end

  def right(board, row_index, col_index)
    return [] if col_index == 8

    horizontal_moves_right(board, row_index, col_index, col_index + 1)
  end

  def upper_right(board, row_index, col_index)
    return [] if row_index == 8

    upper_moves_right(board, row_index, col_index, row_index + 1)
  end

  def upper_left(board, row_index, col_index)
    return [] if row_index == 8

    upper_moves_left(board, row_index, col_index, row_index + 1)
  end

  def lower_right(board, row_index, col_index)
    return [] if row_index == 1

    lower_moves_right(board, row_index, col_index, row_index - 1)
  end

  def lower_left(board, row_index, col_index)
    return [] if row_index == 1

    lower_moves_left(board, row_index, col_index, row_index - 1)
  end
end
