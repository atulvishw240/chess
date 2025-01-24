# DIAGONAL MOVES
module Diagonal
  def upper_moves_left(board, row_index, col_index, stop_row = 8, stop_col = 1)
    moves = []
    until row_index == stop_row || col_index == stop_col
      row_index += 1
      col_index -= 1
      moves << [row_index, col_index]

      square = board.get_square(row_index, col_index)
      return moves if square.contains_piece?
    end

    moves
  end

  def lower_moves_right(board, row_index, col_index, stop_row = 1, stop_col = 8)
    moves = []
    until row_index == stop_row || col_index == stop_col
      row_index -= 1
      col_index += 1
      moves << [row_index, col_index]

      square = board.get_square(row_index, col_index)
      return moves if square.contains_piece?
    end

    moves
  end
end
