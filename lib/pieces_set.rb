require_relative "../pieces/pawn"
require_relative "../pieces/rook"
require_relative "../pieces/knight"
require_relative "../pieces/bishop"
require_relative "../pieces/queen"
require_relative "../pieces/king"

# A PIECES SET TO PLAY A GAME
class SetOfPieces
  attr_accessor :set

  def initialize(color)
    @set = []
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

  def all_possible_selections
    possible_selections = []
    set.each do |piece|
      pos = piece.position
      possible_selections << pos
    end

    possible_selections
  end

  def delete_piece(piece)
    set.each do |element|
      set.delete(piece) if piece == element
    end
  end

  def piece_at(coordinates)
    set.each do |piece|
      return piece if piece.position == coordinates
    end
  end

  private

  def create_pawns(color)
    counter = 0
    until counter == 8
      pawn = Pawn.new(color)
      set << pawn
      counter += 1
    end
  end

  def create_rook(color)
    rook = Rook.new(color)
    set << rook
  end

  def create_knight(color)
    knight = Knight.new(color)
    set << knight
  end

  def create_bishop(color)
    bishop = Bishop.new(color)
    set << bishop
  end

  def create_queen_and_king(color)
    king = King.new(color)
    queen = Queen.new(color)

    set << queen
    set << king
  end
end
