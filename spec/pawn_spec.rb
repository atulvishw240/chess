require_relative "../pieces/pawn"
require_relative "../pieces/bishop"
require_relative "../lib/board"

describe Pawn do
  before(:each) do
    @board = Board.new
    @pawn = Pawn.new("Pawn")
    @pawn.board = @board
  end

  describe "#move" do
    it "moves pawn 1 step forward" do
      @pawn.position = [2, 1]
      expect(@pawn.move).to eq([3, 1])
    end

    it "can't move when blocked by other piece (opponent or own)" do
      @bishop = Bishop.new("B")
      @bishop.board = @board
      @bishop.position = [4, 1]

      @pawn.position = [3, 1]
      expect(@pawn.move).to eq([3, 1])
    end
  end
end
