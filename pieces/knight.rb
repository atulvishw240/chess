require_relative "piece"
require_relative "../lib/mod_utils"

# KNIGHT
class Knight < Piece
  include Utils

  def move
  end

  # A knight make four T's (upper, lower, right, left)
  def all_possible_moves(file, rank)
    positions = []
    coords = possible_coordinates_from_origin

    coords.each do |coord|
      x_coord = rank
      y_coord = file_to_int(file)
      x_coord += coord[0]
      y_coord += coord[1]

      next unless valid_move?(x_coord, y_coord)

      y_coord = int_to_file(y_coord)
      positions << [y_coord, x_coord]
    end

    positions
  end

  # Assuming knight to be at coordinats (0, 0)
  # [rank-coordinate, file_coordinate]
  def possible_coordinates_from_origin
    upper = [[2, 1], [2, -1]]
    lower = [[-2, 1], [-2, -1]]
    right = [[1, 2], [-1, 2]]
    left = [[1, -2], [-1, -2]]
    upper.concat(lower).concat(right).concat(left)
  end

  def valid_move?(x_coord, y_coord)
    x_valid = x_coord.between?(1, 8)
    y_valid = y_coord.between?(1, 8)

    x_valid && y_valid
  end
end
