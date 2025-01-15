# Helper Methods
module Utils
  FILES = ["", "a", "b", "c", "d", "e", "f", "g", "h"].freeze

  def file_to_int(file)
    FILES.index(file)
  end

  def int_to_file(integer)
    FILES[integer]
  end

  # VERTICAL MOVES
  def vertical_moves_forward(file, rank, stop = 8)
    moves = []
    until rank == stop
      rank += 1
      moves << [file, rank]
    end

    moves
  end

  def vertical_moves_backward(file, rank, stop = 1)
    moves = []
    until rank == stop
      rank -= 1
      moves << [file, rank]
    end

    moves
  end

  # HORIZONTAL MOVES
  def horizontal_moves_left(file, rank, stop = 1)
    moves = []
    index = file_to_int(file)
    until index == stop
      index -= 1
      file = int_to_file(index)
      moves << [file, rank]
    end

    moves
  end

  def horizontal_moves_right(file, rank, stop = 8)
    moves = []
    index = file_to_int(file)
    until index == stop
      index += 1
      file = int_to_file(index)
      moves << [file, rank]
    end

    moves
  end

  # DIAGONAL MOVES
  def upper_moves_left(file, rank, stop_row = 8, stop_col = 1)
    moves = []
    col_index = file_to_int(file)
    until rank == stop_row || col_index == stop_col
      rank += 1
      col_index -= 1
      file = int_to_file(col_index)
      moves << [file, rank]
    end

    moves
  end

  def lower_moves_right(file, rank, stop_row = 1, stop_col = 8)
    moves = []
    col_index = file_to_int(file)
    until rank == stop_row || col_index == stop_col
      rank -= 1
      col_index += 1
      file = int_to_file(col_index)
      moves << [file, rank]
    end

    moves
  end

  # REVERSE DIAGONAL MOVES
  def upper_moves_right(file, rank, stop_row = 8, stop_col = 8)
    moves = []
    col_index = file_to_int(file)
    until rank == stop_row || col_index == stop_col
      rank += 1
      col_index += 1
      file = int_to_file(col_index)
      moves << [file, rank]
    end

    moves
  end

  def lower_moves_left(file, rank, stop_row = 1, stop_col = 1)
    moves = []
    col_index = file_to_int(file)
    until rank == stop_row || col_index == stop_col
      rank -= 1
      col_index -= 1
      file = int_to_file(col_index)
      moves << [file, rank]
    end

    moves
  end
end
