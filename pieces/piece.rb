# Piece
class Piece
  attr_accessor :player, :file, :rank
  attr_reader :unicode

  def initialize(unicode)
    @unicode = unicode
  end

  def move; end
  def capture; end
end
