# Piece
class Piece
  attr_accessor :player, :position
  attr_reader :unicode

  def initialize(unicode)
    @unicode = unicode
  end

  def move; end
  def capture; end
end
