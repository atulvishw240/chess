require_relative "../lib/piece"
require_relative "../lib/modules/mod_horizontal"
require_relative "../lib//modules/mod_vertical"

# ROOK
class Rook < Piece
  include Horizontal
  include Vertical

  def initialize(color)
    @unicode = "\u{265C}"
    super
  end

  # Calculate all possible moves for Rook
  def all_possible_moves
    # 1. Calculate forward moves
    # 2. Calculate backward moves
    # 3. Calculate right moves
    # 4. Calculate left moves

    moves = []

    pos = position
    row_index = pos[0]
    col_index = pos[1]

    # 1. Calculate forward moves, if rook is at [1, 1]
    until row_index == 8
      row_index += 1
      moves << [row_index, col_index]
    end

    # 2. Calculate backward moves
    pos = position
    row_index = pos[0]
    col_index = pos[1]

    until row_index == 1
      row_index -= 1
      moves << [row_index, col_index]
    end

    # 3. Calculate right moves
    pos = position
    row_index = pos[0]
    col_index = pos[1]

    until col_index == 8
      col_index += 1
      moves << [row_index, col_index]
    end

    # 4. Calculate left moves
    pos = position
    row_index = pos[0]
    col_index = pos[1]

    until col_index == 1
      col_index -= 1
      moves << [row_index, col_index]
    end

    moves
  end
end
