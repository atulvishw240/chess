# VERTICAL MOVES
module Vertical
  def vertical_moves_forward(board, row_index, col_index, stop = 8)
    moves = []
    until row_index == stop
      row_index += 1
      moves << [row_index, col_index]

      square = board.get_square(row_index, col_index)
      return moves if square.contains_piece?
    end

    moves
  end

  def vertical_moves_backward(board, row_index, col_index, stop = 1)
    moves = []
    until row_index == stop
      row_index -= 1
      moves << [row_index, col_index]

      square = board.get_square(row_index, col_index)
      return moves if square.contains_piece?
    end

    moves
  end
end
