require_relative "../lib/game"
require_relative "../lib/board"
require_relative "../lib/pieces_set"
require_relative "../lib/player"

describe Game do
  before(:each) do
    black = SetOfPieces.new("\e[30m")
    brown = SetOfPieces.new("\e[38;5;160m")
    board = Board.new(black, brown)

    player1 = Player.new("Atul Vishwakarma")
    player2 = Player.new("Gaurav Vishwakarma")
    game = Game.new(board, player1, player2)
  end

  describe "#check" do
    it "returns true if King's in check" do
    end
  end
end
