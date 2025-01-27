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

  def move
    row_index = self.row_index
    col_index = self.col_index
    board = self.board
    moves = all_possible_moves(board, row_index, col_index)
  end

  #----------------------------------------ALL PRIVATE METHODS ARE BELOW-------------------------------------------

  # private

  def all_possible_moves(board)
    positions = []
    row_index = row
    col_index = col

    vertical_positions = vertical_moves(board, row_index, col_index)
    horizontal_positions = horizontal_moves(board, row_index, col_index)
    positions.concat(vertical_positions)
    positions.concat(horizontal_positions)
  end

  private # Temporary, once we complete our move functionality we'll comment out the above 'private'

  def vertical_moves(board, row_index, col_index)
    moves = []
    forward = vertical_moves_forward(board, row_index, col_index)
    backward = vertical_moves_backward(board, row_index, col_index)
    moves.concat(forward)
    moves.concat(backward)
  end

  def horizontal_moves(board, row_index, col_index)
    moves = []
    left = horizontal_moves_left(board, row_index, col_index)
    right = horizontal_moves_right(board, row_index, col_index)
    moves.concat(left)
    moves.concat(right)
  end
end
