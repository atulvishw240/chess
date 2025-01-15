require_relative "piece"
require_relative "../lib/mod_utils"
# KING
class King < Piece
  include Utils

  def move
    
  end

  #----------------------------------------ALL PRIVATE METHODS ARE BELOW-------------------------------------------

  # private
  def all_possible_moves(file, rank)
    moves = []
    moves << vertical_moves_forward(file, rank, rank + 1)
    moves << vertical_moves_backward(file, rank, rank - 1)
    moves << horizontal_moves_right(file, rank, file_to_int(file) + 1)
    moves << horizontal_moves_left(file, rank, file_to_int(file) - 1)
    moves << upper_moves_right(file, rank, rank + 1)
    moves << upper_moves_left(file, rank, rank + 1)
    moves << lower_moves_left(file, rank, rank - 1)
    moves << lower_moves_right(file, rank, rank - 1)
  end
end
