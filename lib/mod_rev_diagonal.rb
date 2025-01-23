# REVERSE DIAGONAL MOVES
module ReverseDiagonal
  def upper_moves_right(row_index, col_index, stop_row = 8, stop_col = 8)
    moves = []
    until row_index == stop_row || col_index == stop_col
      row_index += 1
      col_index += 1
      moves << [row_index, col_index]
    end

    moves
  end

  def lower_moves_left(row_index, col_index, stop_row = 1, stop_col = 1)
    moves = []
    until row_index == stop_row || col_index == stop_col
      row_index -= 1
      col_index -= 1
      moves << [row_index, col_index]
    end

    moves
  end
end
