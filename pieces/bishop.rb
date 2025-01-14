require_relative "piece"
require_relative "../lib/mod_utils"
# BISHOP
class Bishop < Piece
  include Utils

  def move
    
  end

  #----------------------------------------ALL PRIVATE METHODS ARE BELOW-------------------------------------------

  private

  def all_possible_moves(file, rank)
    positions = []
    upper_right = upper_right_moves(file, rank)
    upper_left = upper_left_moves(file, rank)
    lower_right = lower_right_moves(file, rank)
    lower_left = lower_left_moves(file, rank)
    positions.concat(upper_left).concat(upper_right)
             .concat(lower_left).concat(lower_right)
  end
end
