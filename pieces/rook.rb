require_relative "piece"
require_relative "../lib/mod_horizontal"
require_relative "../lib/mod_vertical"

# ROOK
class Rook < Piece
  include Horizontal
  include Vertical

  def move
    file = self.file
    rank = self.rank
    moves = all_possible_moves(file, rank)
  end

  #----------------------------------------ALL PRIVATE METHODS ARE BELOW-------------------------------------------

  # private

  def all_possible_moves(file, rank)
    positions = []

    vertical_positions = vertical_moves(file, rank)
    horizontal_positions = horizontal_moves(file, rank)
    positions.concat(vertical_positions)
    positions.concat(horizontal_positions)
  end

  private # Temporary, once we complete our move functionality we'll comment out the above 'private'

  def vertical_moves(file, rank)
    moves = []
    forward = vertical_moves_forward(file, rank)
    backward = vertical_moves_backward(file, rank)
    moves.concat(forward)
    moves.concat(backward)
  end

  def horizontal_moves(file, rank)
    moves = []
    left = horizontal_moves_left(file, rank)
    right = horizontal_moves_right(file, rank)
    moves.concat(left)
    moves.concat(right)
  end
end
