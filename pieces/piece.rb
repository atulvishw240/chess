# Piece
class Piece
  attr_accessor :board, :color, :row_index, :col_index
  attr_reader :unicode

  def initialize(color)
    @color = color
  end

  def move; end
  def capture; end
  def all_possible_moves; end

  def all_possible_captures(moves)
    moves.select do |move|
      capture?(move)
    end
  end

  def capture?(move)
    row_index = move[0]
    col_index = move[1]
    square = board.get_square(row_index, col_index)

    if square.contains_piece?
      piece = square.element
      piece_color = piece.color
      true unless piece_color == color
    else
      false
    end
  end

  def to_s
    "#{self.class} at row-index: #{row_index} and col-index: #{col_index}"
  end
end
