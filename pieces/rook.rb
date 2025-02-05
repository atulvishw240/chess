require_relative "../lib/piece"

# ROOK
class Rook < Piece
  def initialize(color)
    @unicode = "\u{265C}"
    super
  end

  def all_possible_moves
    horizontal_moves.concat(vertical_moves)
  end

  def horizontal_moves
    moves = []

    [8, 1].each do |stop|
      row_index = position[0]
      col_index = position[1]

      until row_index == stop
        row_index = row_or_col(row_index, stop)
        moves << [row_index, col_index]
      end
    end

    moves
  end

  def vertical_moves
    moves = []

    [8, 1].each do |stop|
      row_index = position[0]
      col_index = position[1]

      until col_index == stop
        col_index = row_or_col(col_index, stop)
        moves << [row_index, col_index]
      end
    end

    moves
  end

  def row_or_col(index, stop)
    index += 1 if stop == 8
    index -= 1 if stop == 1

    index
  end
end
