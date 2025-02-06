# calculates all possible moves for Bishop
module Diagonal
  def bishop_moves
    up_left = upper_left_diagonal
    bottom_right = bottom_right_diagonal
    up_right = upper_right_diagonal
    bottom_left = bottom_left_diagonal

    up_left.concat(bottom_right).concat(up_right).concat(bottom_left)
  end

  def upper_left_diagonal
    moves = []

    row_index = position[0]
    col_index = position[1]

    until row_index == 1 || col_index == 1
      row_index -= 1
      col_index -= 1
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

    moves
  end

  def bottom_right_diagonal
    moves = []

    row_index = position[0]
    col_index = position[1]

    until row_index == 8 || col_index == 8
      row_index += 1
      col_index += 1
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

    moves
  end

  def upper_right_diagonal
    moves = []

    row_index = position[0]
    col_index = position[1]

    until row_index == 1 || col_index == 8
      row_index -= 1
      col_index += 1
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

    moves
  end

  def bottom_left_diagonal
    moves = []

    row_index = position[0]
    col_index = position[1]

    until row_index == 8 || col_index == 1
      row_index += 1
      col_index -= 1
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

    moves
  end
end
