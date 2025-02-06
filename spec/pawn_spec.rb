require_relative "../pieces/pawn"
require_relative "../pieces/bishop"
require_relative "../lib/board"

describe Pawn do
  before(:each) do
    @board = Board.new
    black = "\e[30m"
    brown = "\e[38;5;160m"
    @pawn = Pawn.new(black)
    @pawn.board = @board
  end

  describe "#move" do
    it "moves pawn 1 step forward" do
      @pawn.position = [2, 1]
      expect(@pawn.move).to eq([3, 1])
    end

    it "can't move when blocked by other piece (opponent or own)" do
      # Create and place a bishop on [4, 1] square
      @bishop = Bishop.new("B")
      @bishop.board = @board
      @bishop.position = [4, 1]
      square = @board.get_square(4, 1)
      square.element = @bishop

      @pawn.position = [3, 1]
      expect(@pawn.move).to eq([3, 1])
    end
  end

  describe "#start" do
    it "returns starting rank for BLACK piece" do
      expect(@pawn.start).to eq(2)
    end
  end
end
