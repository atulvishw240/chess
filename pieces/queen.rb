require_relative "../pieces/piece"
require_relative "../lib/mod_utils"
require_relative "../lib/mod_horizontal"
require_relative "../lib/mod_vertical"
require_relative "../lib/mod_diagonal"
require_relative "../lib/mod_rev_diagonal"

# QUEEN
class Queen < Piece
  include Utils
  include Horizontal
  include Vertical
  include Diagonal
  include ReverseDiagonal

  def move
    
  end

  def all_possible_moves(row_index, col_index)
    front = vertical_moves_forward(row_index, col_index)
    back = vertical_moves_backward(row_index, col_index)
    right = horizontal_moves_right(row_index, col_index)
    left = horizontal_moves_left(row_index, col_index)
    diagonal = upper_moves_left(row_index, col_index)
               .concat(lower_moves_right(row_index, col_index))
    rev_diagonal = upper_moves_right(row_index, col_index)
                   .concat(lower_moves_left(row_index, col_index))

    front.concat(back).concat(right).concat(left)
         .concat(diagonal).concat(rev_diagonal)
  end
end
