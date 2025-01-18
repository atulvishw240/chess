require_relative "piece"
require_relative "../lib/mod_horizontal"
require_relative "../lib/mod_vertical"
require_relative "../lib/mod_diagonal"
require_relative "../lib/mod_rev_diagonal"

# KING
class King < Piece
  include Horizontal
  include Vertical
  include Diagonal
  include ReverseDiagonal

  def move
    
  end

  #----------------------------------------ALL PRIVATE METHODS ARE BELOW-------------------------------------------

  # private
  def all_possible_moves(row_index, col_index)
    moves = []
    moves.concat(front(row_index, col_index))
         .concat(back(row_index, col_index))
         .concat(right(row_index, col_index))
         .concat(left(row_index, col_index))
         .concat(upper_right(row_index, col_index))
         .concat(upper_left(row_index, col_index))
         .concat(lower_right(row_index, col_index))
         .concat(lower_left(row_index, col_index))
  end

  private


  def front(row_index, col_index)
    return [] if row_index == 8

    vertical_moves_forward(row_index, col_index, row_index + 1)
  end

  def back(row_index, col_index)
    return [] if row_index == 1

    vertical_moves_backward(row_index, col_index, row_index - 1)
  end

  def left(row_index, col_index)
    return [] if col_index == 1

    horizontal_moves_left(row_index, col_index, col_index - 1)
  end

  def right(row_index, col_index)
    return [] if col_index == 8

    horizontal_moves_right(row_index, col_index, col_index + 1)
  end

  def upper_right(row_index, col_index)
    return [] if row_index == 8

    upper_moves_right(row_index, col_index, row_index + 1)
  end

  def upper_left(row_index, col_index)
    return [] if row_index == 8

    upper_moves_left(row_index, col_index, row_index + 1)
  end

  def lower_right(row_index, col_index)
    return [] if row_index == 1

    lower_moves_right(row_index, col_index, row_index - 1)
  end

  def lower_left(row_index, col_index)
    return [] if row_index == 1

    lower_moves_left(row_index, col_index, row_index - 1)
  end
end
