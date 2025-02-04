require_relative "../lib/piece"
# require_relative "../lib/mod_utils"

# BISHOP
class Bishop < Piece
  def initialize(color)
    @unicode = "\u{265D}"
    super
  end

  #----------------------------------------ALL PRIVATE METHODS ARE BELOW-------------------------------------------

  def all_possible_moves
    positions = []
    row_index = row
    col_index = col

    upper_right = upper_moves_right(board, row_index, col_index)
    upper_left = upper_moves_left(board, row_index, col_index)
    lower_right = lower_moves_right(board, row_index, col_index)
    lower_left = lower_moves_left(board, row_index, col_index)

    positions.concat(upper_right).concat(upper_left)
             .concat(lower_right).concat(lower_left)
  end
end
