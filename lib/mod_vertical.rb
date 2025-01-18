require_relative "mod_utils"
# VERTICAL MOVES
module Vertical
  include Utils

  def vertical_moves_forward(file, rank, stop = 8)
    moves = []
    until rank == stop
      rank += 1
      moves << [file, rank]
    end

    moves
  end

  def vertical_moves_backward(file, rank, stop = 1)
    moves = []
    until rank == stop
      rank -= 1
      moves << [file, rank]
    end

    moves
  end
end
