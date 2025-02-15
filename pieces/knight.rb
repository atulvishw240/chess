require_relative "../lib/piece"
require_relative "../lib/modules/mod_utils"

# KNIGHT
class Knight < Piece
  include Utils

  def initialize(color)
    @unicode = "\u{265E}"
    super
  end

  # A knight make four T's (upper, lower, right, left)
  def all_possible_moves
    moves = []

    coords = possible_coordinates_from_origin

    coords.each do |coord|
      x_coord = coord[0]
      y_coord = coord[1]
      x_coord += position[0]
      y_coord += position[1]

      next unless valid_move?(x_coord, y_coord)

      move = [x_coord, y_coord]
      square = board.get_square(x_coord, y_coord)
      if square.contains_piece?
        piece = square.element
        unless color == piece.color
          moves << move
          next
        end

        next # next because we aren't calculating moves in a continuous fashion.
      end

      moves << move
    end

    moves
  end

  # Assuming knight to be at coordinates (0, 0)
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
