require_relative "../pieces/pawn"
require_relative "../pieces/rook"
require_relative "../pieces/knight"
require_relative "../pieces/bishop"
require_relative "../pieces/queen"
require_relative "../pieces/king"

# A PIECES SET TO PLAY A GAME
class SetOfPieces
  attr_accessor :pieces, :pawns

  def initialize(color)
    @pieces = [""]
    @pawns = [""]
    create_pieces(color)
  end

  def create_pieces(color)
    create_rook(color)
    create_knight(color)
    create_bishop(color)
    create_queen_and_king(color)
    create_bishop(color)
    create_knight(color)
    create_rook(color)
    create_pawns(color)
  end

  private

  def create_pawns(color)
    counter = 0
    until counter == 8
      @pawn = Pawn.new("#{color}♟")
      pawns << @pawn
      counter += 1
    end
  end

  def create_rook(color)
    @rook = Rook.new("#{color}♜")
    pieces << @rook
  end

  def create_knight(color)
    @knight = Knight.new("#{color}♞")
    pieces << @knight
  end

  def create_bishop(color)
    @bishop = Bishop.new("#{color}♝")
    pieces << @bishop
  end

  def create_queen_and_king(color)
    @king = King.new("#{color}♚")
    @queen = Queen.new("#{color}♛")

    pieces << @queen
    pieces << @king
  end
end
