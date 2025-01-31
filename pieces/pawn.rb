require_relative "../lib/piece"
require_relative "../lib/modules/mod_colorable"
# PAWN
class Pawn < Piece
  include Colorable

  attr_accessor :start

  def initialize(color)
    @unicode = "\u{265F}"
    @start = true
    super
  end

  # Moves
  # If it's a BLACK pawn then it will march forward by (rank - 1)
  # If it's a BROWN pawn then it will march forward by (rank + 1)

  # CAPTURES
  # If it's a BLACK pawn then it'll capture at (rank - 1, column +/- 1)
  # If it's a BROWN pawn then it'll capture at (rank + 1, column +/- 1)

  # It's easier to start with BROWN pawn, so let's do so.

  # To check if the pawn is BROWN, if it isn't then it's BLACK

  # FOR BROWN PAWN

  def all_possible_moves
    moves = []
    if start
      moves.concat(march_two_step)
    else
      moves.concat(march_one_step)
    end

    moves.concat(capture)
  end

  def march_one_step
    move = []
    rank = row

    move << [rank + 1, col]
  end

  def march_two_step
    moves = []
    rank = row

    moves << [rank + 1, col]
    moves << [rank + 2, col]
  end

  def capture
    move = []
    rank = row

    move << [rank + 1, col + 1]
    move << [rank + 1, col - 1]
  end
end

pawn = Pawn.new("red")
pawn.row = 2
pawn.col = 2
pawn.all_possible_moves
