require_relative "piece"
# require_relative "../lib/mod_utils"
require_relative "../lib/mod_diagonal"
require_relative "../lib/mod_rev_diagonal"

# BISHOP
class Bishop < Piece
  include Diagonal
  include ReverseDiagonal

  def move
    
  end

  #----------------------------------------ALL PRIVATE METHODS ARE BELOW-------------------------------------------

  def all_possible_moves(file, rank)
    positions = []
    upper_right = upper_moves_right(file, rank)
    upper_left = upper_moves_left(file, rank)
    lower_right = lower_moves_right(file, rank)
    lower_left = lower_moves_left(file, rank)
    positions.concat(upper_right).concat(upper_left)
             .concat(lower_right).concat(lower_left)
  end
end
