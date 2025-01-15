require_relative "../pieces/piece"
require_relative "../lib/mod_utils"
require_relative "../lib/mod_horizontal"
require_relative "../lib/mod_vertical"
require_relative "../lib/mod_diagonal"
require_relative "../lib/mod_rev_diagonal"

# QUEEN
class Queen < Piece
  include Utils
  include Horizontal
  include Vertical
  include Diagonal
  include ReverseDiagonal

  def move
    
  end

  def all_possible_moves(file, rank)
    front = vertical_moves_forward(file, rank)
    back = vertical_moves_backward(file, rank)
    right = horizontal_moves_right(file, rank)
    left = horizontal_moves_left(file, rank)
    diagonal = upper_moves_left(file, rank)
               .concat(lower_moves_right(file, rank))
    rev_diagonal = upper_moves_right(file, rank)
                   .concat(lower_moves_left(file, rank))

    front.concat(back).concat(right).concat(left)
         .concat(diagonal).concat(rev_diagonal)
  end
end

queen = Queen.new("Queen")
p queen.all_possible_moves("e", 4)
