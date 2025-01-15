require_relative "mod_utils"

# DIAGONAL MOVES
module Diagonal
  include Utils

  def upper_moves_left(file, rank, stop_row = 8, stop_col = 1)
    moves = []
    col_index = file_to_int(file)
    until rank == stop_row || col_index == stop_col
      rank += 1
      col_index -= 1
      file = int_to_file(col_index)
      moves << [file, rank]
    end

    moves
  end

  def lower_moves_right(file, rank, stop_row = 1, stop_col = 8)
    moves = []
    col_index = file_to_int(file)
    until rank == stop_row || col_index == stop_col
      rank -= 1
      col_index += 1
      file = int_to_file(col_index)
      moves << [file, rank]
    end

    moves
  end
end
