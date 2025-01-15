require_relative "piece"
require_relative "../lib/mod_utils"
require_relative "../lib/mod_horizontal"
require_relative "../lib/mod_vertical"

# KNIGHT
class Knight < Piece
  include Utils
  include Horizontal
  include Vertical

  def move
    
  end

  def all_possible_moves(file, rank)
    positions = []
    coords = possible_coordinates_from_origin

    coords.each do |coord|
      x_coord = rank
      y_coord = file_to_int(file)

      x_coord += coord[0]
      y_coord += coord[1]

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
end

knight = Knight.new("Knight")
p knight.all_possible_moves("f", 3)
