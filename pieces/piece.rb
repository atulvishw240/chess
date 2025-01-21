# Piece
class Piece
  attr_accessor :player, :row_index, :col_index
  attr_reader :unicode

  def initialize(unicode)
    @unicode = unicode
  end

  def move; end
  def capture; end
  def all_possible_moves; end
end
