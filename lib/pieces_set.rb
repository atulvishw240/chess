require_relative "../pieces/pawn"
require_relative "../pieces/rook"
require_relative "../pieces/knight"
require_relative "../pieces/bishop"
require_relative "../pieces/queen"
require_relative "../pieces/king"

# A PIECES SET TO PLAY A GAME
class SetOfPieces
  attr_accessor :pieces

  def initialize(player, color)
    create_pieces(player, color)
    @pieces = []
  end

  def create_pieces(player, color)
    pawns(color)
    king_and_queen(color)
    rook_knight_and_bishop(color)
    pieces_belong_to_player(player)
  end

  private

  def pawns(color)
    counter = 0
    until counter == 8
      @pawn = Pawn.new("#{color}♟")
      pieces << @pawn
      counter += 1
    end
  end

  def rook_knight_and_bishop(color)
    counter = 0
    until counter == 2
      @rook = Rook.new("#{color}♜")
      @knight = Knight.new("#{color}♞")
      @bishop = Bishop.new("#{color}♝")

      pieces << @rook
      pieces << @knight
      pieces << @bishop
    end
  end

  def king_and_queen(color)
    @queen = Queen.new("#{color}♛")
    @king = King.new("#{color}♚")

    pieces << @king
    pieces << @queen
  end

  def pieces_belong_to_player(player)
    pieces.each do |piece|
      piece.player = player
    end
  end
end
