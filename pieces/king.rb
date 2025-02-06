require_relative "../lib/piece"

# KING
class King < Piece
  def initialize(color)
    @unicode = "\u{265A}"
    super
  end

  def all_possible_moves
    moves = []

    coords = possible_king_moves_from_origin
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

        next
      end

      moves << move
    end

    moves
  end

  # Considering king is at origin
  def possible_king_moves_from_origin
    front = [[1, -1], [1, 0], [1, 1]]
    back = [[-1, -1], [-1, 0], [-1, 1]]
    left = [[0, -1]]
    right = [[0, 1]]

    front.concat(back).concat(right).concat(left)
  end

  def valid_move?(x_coord, y_coord)
    x_valid = x_coord.between?(1, 8)
    y_valid = y_coord.between?(1, 8)

    x_valid && y_valid
  end
end
