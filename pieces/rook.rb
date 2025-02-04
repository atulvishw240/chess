require_relative "../lib/piece"

# ROOK
class Rook < Piece
  def initialize(color)
    @unicode = "\u{265C}"
    super
  end

  def all_possible_moves
    front = forward_moves
    back = backward_moves
    right = right_moves
    left = left_moves

    front.concat(back).concat(right).concat(left)
  end

  def forward_moves
    moves = []

    row_index = position[0]
    col_index = position[1]

    until row_index == 8
      row_index += 1
      moves << [row_index, col_index]
    end

    moves
  end

  def backward_moves
    moves = []

    row_index = position[0]
    col_index = position[1]

    until row_index == 1
      row_index -= 1
      moves << [row_index, col_index]
    end

    moves
  end

  def right_moves
    moves = []

    row_index = position[0]
    col_index = position[1]

    until col_index == 8
      col_index += 1
      moves << [row_index, col_index]
    end

    moves
  end

  def left_moves
    moves = []

    row_index = position[0]
    col_index = position[1]

    until col_index == 1
      col_index -= 1
      moves << [row_index, col_index]
    end

    moves
  end
end
