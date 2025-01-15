require_relative "mod_utils"

# HORIZONTAL MOVES
module Horizontal
  include Utils

  def horizontal_moves_left(file, rank, stop = 1)
    moves = []
    index = file_to_int(file)
    until index == stop
      index -= 1
      file = int_to_file(index)
      moves << [file, rank]
    end

    moves
  end

  def horizontal_moves_right(file, rank, stop = 8)
    moves = []
    index = file_to_int(file)
    until index == stop
      index += 1
      file = int_to_file(index)
      moves << [file, rank]
    end

    moves
  end
end
