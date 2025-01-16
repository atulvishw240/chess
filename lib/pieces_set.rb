require_relative "../pieces/pawn"
require_relative "../pieces/rook"
require_relative "../pieces/knight"
require_relative "../pieces/bishop"
require_relative "../pieces/queen"
require_relative "../pieces/king"

# A PIECES SET TO PLAY A GAME
class SetOfPieces
  attr_accessor :set

  def initialize(player, color)
    @set = []
    create_pieces(player, color)
  end

  def create_pieces(player, color)
    rook(color)
    knight(color)
    bishop(color)
    queen_and_king(color)
    pawns(color)
    pieces_belong_to_player(player)
  end

  private

  def pawns(color)
    counter = 0
    until counter == 8
      @pawn = Pawn.new("#{color}♟")
      set << @pawn
      counter += 1
    end
  end

  def rook(color)
    counter = 0
    until counter == 2
      @rook = Rook.new("#{color}♜")
      set << @rook

      counter += 1
    end
  end

  def knight(color)
    counter = 0
    until counter == 2
      @knight = Knight.new("#{color}♞")
      set << @knight

      counter += 1
    end
  end

  def bishop(color)
    counter = 0
    until counter == 2
      @bishop = Bishop.new("#{color}♝")
      set << @bishop

      counter += 1
    end
  end

  def queen_and_king(color)
    @king = King.new("#{color}♚")
    @queen = Queen.new("#{color}♛")

    set << @queen
    set << @king
  end

  def pieces_belong_to_player(player)
    set.each do |piece|
      piece.player = player
    end
  end
end
