require_relative "piece"
require_relative "../lib/mod_horizontal"
require_relative "../lib/mod_vertical"
require_relative "../lib/mod_diagonal"
require_relative "../lib/mod_rev_diagonal"

# KING
class King < Piece
  include Horizontal
  include Vertical
  include Diagonal
  include ReverseDiagonal

  def move
    
  end

  #----------------------------------------ALL PRIVATE METHODS ARE BELOW-------------------------------------------

  # private
  def all_possible_moves(file, rank)
    moves = []
    moves.concat(front(file, rank))
         .concat(back(file, rank))
         .concat(right(file, rank))
         .concat(left(file, rank))
         .concat(upper_right(file, rank))
         .concat(upper_left(file,rank))
         .concat(lower_right(file, rank))
         .concat(lower_left(file, rank))
  end

  private


  def front(file, rank)
    return [] if rank == 8

    vertical_moves_forward(file, rank, rank + 1)
  end

  def back(file, rank)
    return [] if rank == 1

    vertical_moves_backward(file, rank, rank - 1)
  end

  def left(file, rank)
    col_index = file_to_int(file)
    return [] if col_index == 1

    horizontal_moves_left(file, rank, col_index - 1)
  end

  def right(file, rank)
    col_index = file_to_int(file)
    return [] if col_index == 8

    horizontal_moves_right(file, rank, col_index + 1)
  end

  def upper_right(file, rank)
    return [] if rank == 8

    upper_moves_right(file, rank, rank + 1)
  end

  def upper_left(file, rank)
    return [] if rank == 8

    upper_moves_left(file, rank, rank + 1)
  end

  def lower_right(file, rank)
    return [] if rank == 1

    lower_moves_right(file, rank, rank - 1)
  end

  def lower_left(file, rank)
    return [] if rank == 1

    lower_moves_left(file, rank, rank - 1)
  end
end
