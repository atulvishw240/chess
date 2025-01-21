require_relative "mod_utils"

# HORIZONTAL MOVES
module Horizontal
  include Utils

  def horizontal_moves_left(board, row_index, col_index, stop = 1)
    moves = []
    until col_index == stop
      col_index -= 1
      moves << [row_index, col_index]

      square = board.get_square(row_index, col_index)
      return moves if square.contains_piece?
    end

    moves
  end

  def horizontal_moves_right(board, row_index, col_index, stop = 8)
    moves = []
    until col_index == stop
      col_index += 1
      moves << [row_index, col_index]

      square = board.get_square(row_index, col_index)
      return moves if square.contains_piece?
    end

    moves
  end
end
