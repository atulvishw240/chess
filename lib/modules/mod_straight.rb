# calculates all possible moves for Rook
module Straight
  def rook_moves
    horizontal_moves.concat(vertical_moves)
  end

  def horizontal_moves # rubocop:disable Metrics/AbcSize,Metrics/MethodLength
    moves = []

    [8, 1].each do |stop|
      row_index = position[0]
      col_index = position[1]

      until row_index == stop
        row_index = row_or_col(row_index, stop)
        move = [row_index, col_index]
        square = board.get_square(row_index, col_index)

        if square.contains_piece?
          piece = square.element
          unless color == piece.color # It's your opponent's piece
            moves << move
            break
          end

          break
        end

        moves << move
      end
    end

    moves
  end

  def vertical_moves # rubocop:disable Metrics/AbcSize,Metrics/MethodLength
    moves = []

    [8, 1].each do |stop|
      row_index = position[0]
      col_index = position[1]

      until col_index == stop
        col_index = row_or_col(col_index, stop)
        move = [row_index, col_index]
        square = board.get_square(row_index, col_index)

        if square.contains_piece?
          piece = square.element
          unless color == piece.color # It's your opponent's piece
            moves << move
            break
          end

          break
        end

        moves << move
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
