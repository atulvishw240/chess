require_relative "piece"
require_relative "../lib/mod_utils"
# BISHOP
class Bishop < Piece
  include Utils

  def move
    
  end

  #----------------------------------------ALL PRIVATE METHODS ARE BELOW-------------------------------------------

  def all_possible_moves(file, rank)
    positions = []
    upper_right = upper_right_moves(file, rank)
    upper_left = upper_left_moves(file, rank)
    lower_right = lower_right_moves(file, rank)
    lower_left = lower_left_moves(file, rank)
    positions.concat(upper_right).concat(upper_left)
    .concat(lower_right).concat(lower_left)
  end

  private

  def upper_right_moves(file, rank)
    moves = []
    col_index = file_to_int(file)
    until rank == 8 || col_index == 8
      rank += 1
      col_index += 1
      file = int_to_file(col_index)
      moves << [file, rank]
    end

    moves
  end

  def upper_left_moves(file, rank)
    moves = []
    col_index = file_to_int(file)
    until rank == 8 || col_index == 1
      rank += 1
      col_index -= 1
      file = int_to_file(col_index)
      moves << [file, rank]
    end

    moves
  end

  def lower_right_moves(file, rank)
    moves = []
    col_index = file_to_int(file)
    until rank == 1 || col_index == 8
      rank -= 1
      col_index += 1
      file = int_to_file(col_index)
      moves << [file, rank]
    end

    moves
  end

  def lower_left_moves(file, rank)
    moves = []
    col_index = file_to_int(file)
    until rank == 1 || col_index == 1
      rank -= 1
      col_index -= 1
      file = int_to_file(col_index)
      moves << [file, rank]
    end

    moves
  end
end
