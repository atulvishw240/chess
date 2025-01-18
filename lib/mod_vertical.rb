require_relative "mod_utils"
# VERTICAL MOVES
module Vertical
  include Utils

  def vertical_moves_forward(row_index, col_index, stop = 8)
    moves = []
    until row_index == stop
      row_index += 1
      moves << [row_index, col_index]
    end

    moves
  end

  def vertical_moves_backward(row_index, col_index, stop = 1)
    moves = []
    until row_index == stop
      row_index -= 1
      moves << [row_index, col_index]
    end

    moves
  end
end
