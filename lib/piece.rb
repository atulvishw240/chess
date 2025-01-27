# Piece
class Piece
  attr_accessor :color, :row, :col
  attr_reader :unicode

  def initialize(color)
    @color = color
  end

  def move; end
  def all_possible_moves(board); end

  # Exclude squares which has a piece from all_possible_moves
  def useful_moves(board)
    moves = all_possible_moves(board)
    moves.select do |move|
      row_index = move[0]
      col_index = move[1]

      square = board.get_square(row_index, col_index)
      square.empty?
    end
  end

  def update_position(row_index, col_index)
    self.row = row_index
    self.col = col_index
  end

  def all_possible_captures(board, moves)
    moves.select do |move|
      capture?(board, move)
    end
  end

  def capture?(board, move)
    row_index = move[0]
    col_index = move[1]
    square = board.get_square(row_index, col_index)

    if square.contains_piece?
      piece = square.element
      true unless piece.color == color
    else
      false
    end
  end

  def to_s
    "#{self.class} at row-index: #{row_index} and col-index: #{col_index}"
  end
end
