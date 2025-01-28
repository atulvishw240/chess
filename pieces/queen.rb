require_relative "../lib/piece"
require_relative "../lib/modules/mod_utils"
require_relative "../lib/modules/mod_horizontal"
require_relative "../lib/modules/mod_vertical"
require_relative "../lib/modules/mod_diagonal"
require_relative "../lib/modules/mod_rev_diagonal"

# QUEEN
class Queen < Piece
  include Utils
  include Horizontal
  include Vertical
  include Diagonal
  include ReverseDiagonal

  def initialize(color)
    @unicode = "\u{265B}"
    super
  end

  def all_possible_moves
    row_index = row
    col_index = col

    front = vertical_moves_forward(board, row_index, col_index)
    back = vertical_moves_backward(board, row_index, col_index)
    right = horizontal_moves_right(board, row_index, col_index)
    left = horizontal_moves_left(board, row_index, col_index)

    diagonal = upper_moves_left(board, row_index, col_index)
               .concat(lower_moves_right(board, row_index, col_index))
    rev_diagonal = upper_moves_right(board, row_index, col_index)
                   .concat(lower_moves_left(board, row_index, col_index))

    front.concat(back).concat(right).concat(left)
         .concat(diagonal).concat(rev_diagonal)
  end
end
