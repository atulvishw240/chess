require_relative "piece"
require_relative "../lib/mod_utils"
# ROOK
class Rook < Piece
  include Utils

  def move
    
  end

  #----------------------------------------ALL PRIVATE METHODS ARE BELOW-------------------------------------------

  # private

  def all_possible_moves
    positions = []
    file = self.file
    rank = self.rank

    vertical_positions = vertical_moves(file, rank)
  end

  # VERTICAL MOVES
  def vertical_moves(file, rank)
    moves = []
    forward = front_moves(file, rank)
    backward = back_moves(file, rank)
    moves.concat(forward)
    moves.concat(backward)
  end

  def front_moves(file, rank)
    moves = []
    until rank == 8
      rank += 1
      moves << [file, rank]
    end

    moves
  end

  def back_moves(file, rank)
    moves = []
    until rank == 1
      rank -= 1
      moves << [file, rank]
    end

    moves
  end

  # HORIZONTAL MOVES
  def horizontal_moves(file, rank)
    moves = []
    left = left_moves(file, rank)
    right = right_moves(file, rank)
    moves.concat(left)
    moves.concat(right)
  end

  def left_moves(file, rank)
    moves = []
    index = file_to_int(file)
    until index == 1
      index -= 1
      file = int_to_file(index)
      moves << [file, rank]
    end

    moves
  end

  def right_moves(file, rank)
    moves = []
    index = file_to_int(file)
    until index == 8
      index += 1
      file = int_to_file(index)
      moves << [file, rank]
    end

    moves
  end
end
