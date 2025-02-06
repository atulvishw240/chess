require_relative "../pieces/pawn"
require_relative "../pieces/bishop"
require_relative "../lib/board"

describe Pawn do # rubocop:disable Metrics/BlockLength
  before(:each) do
    @board = Board.new
    black = "\e[30m"
    @pawn = Pawn.new(black)
    @pawn.board = @board
  end

  describe "#move" do
    it "BLACK: moves pawn 1 step forward" do
      @pawn.position = [2, 1]
      expect(@pawn.move).to eq([3, 1])
    end

    it "BROWN: moves pawn 1 step forward" do
      brown = "\e[38;5;160m"
      @pawn2 = Pawn.new(brown)
      @pawn2.position = [7, 1]
      @pawn2.board = @board

      expect(@pawn2.move).to eq([6, 1])
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

    it "returns starting rank for BROWN piece" do
      brown = "\e[38;5;160m"
      @pawn2 = Pawn.new(brown)

      expect(@pawn2.start).to eq(7)
    end
  end

  describe "#move_two_steps" do
    it "BLACK: moves pawn 2 steps forward, if it's at start; from [2, 1] to [4, 1]" do
      @pawn.position = [2, 1]
      expect(@pawn.move_two_steps).to eq([4, 1])
    end

    it "BLACK: moves pawn 2 steps forward, if it's at start; from [2, 3] to [4, 3]" do
      @pawn.position = [2, 3]
      expect(@pawn.move_two_steps).to eq([4, 3])
    end

    it "BROWN: moves pawn 2 steps forward, if it's at start; from [7, 3] to [5, 3]" do
      brown = "\e[38;5;160m"

      @pawn2 = Pawn.new(brown)
      @pawn2.position = [7, 3]
      @pawn2.board = @board

      expect(@pawn2.move_two_steps).to eq([5, 3])
    end
  end
end
