require_relative "../lib/piece"
# require_relative "../lib/mod_utils"

# BISHOP
class Bishop < Piece
  def initialize(color)
    @unicode = "\u{265D}"
    super
  end

  def all_possible_moves
    up_left = upper_left_diagonal
    bottom_right = bottom_right_diagonal
    up_right = upper_right_diagonal
    bottom_left = bottom_left_diagonal

    up_left.concat(bottom_right).concat(up_right).concat(bottom_left)
  end

  def upper_left_diagonal
    moves = []

    row_index = position[0]
    col_index = position[1]

    until row_index == 1 || col_index == 1
      row_index -= 1
      col_index -= 1
      moves << [row_index, col_index]
    end

    moves
  end

  def bottom_right_diagonal
    moves = []

    row_index = position[0]
    col_index = position[1]

    until row_index == 8 || col_index == 8
      row_index += 1
      col_index += 1
      moves << [row_index, col_index]
    end

    moves
  end

  def upper_right_diagonal
    moves = []

    row_index = position[0]
    col_index = position[1]

    until row_index == 1 || col_index == 8
      row_index -= 1
      col_index += 1
      moves << [row_index, col_index]
    end

    moves
  end

  def bottom_left_diagonal
    moves = []

    row_index = position[0]
    col_index = position[1]

    until row_index == 8 || col_index == 1
      row_index += 1
      col_index -= 1
      moves << [row_index, col_index]
    end

    moves
  end
end
