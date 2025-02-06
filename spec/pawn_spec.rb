require_relative "../pieces/pawn"
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
  end
end
