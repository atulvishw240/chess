require_relative "mod_utils"

# HORIZONTAL MOVES
module Horizontal
  include Utils

  def horizontal_moves_left(row_index, col_index, stop = 1)
    moves = []
    until col_index == stop
      col_index -= 1
      moves << [row_index, col_index]
    end

    moves
  end

  def horizontal_moves_right(row_index, col_index, stop = 8)
    moves = []
    until col_index == stop
      col_index += 1
      moves << [row_index, col_index]
    end

    moves
  end
end
