require_relative "../pieces/pawn"
require_relative "../pieces/bishop"
require_relative "../lib/board"

describe Pawn do # rubocop:disable Metrics/BlockLength
  before(:each) do
    # Colors
    brown = "\e[38;5;160m"
    black = "\e[30m"

    @board = Board.new
    @black_pawn = Pawn.new(black)
    @black_pawn.board = @board

    @brown_pawn = Pawn.new(brown)
    @brown_pawn.board = @board

    # Bishop
    @brown_bishop = Bishop.new(brown)
    @brown_bishop.board = @board
    @black_bishop = Bishop.new(black)
    @black_bishop.board = @board
  end

  describe "#move" do
    it "BLACK: moves pawn 1 step forward" do
      @black_pawn.position = [2, 1]
      expect(@black_pawn.move).to eq([3, 1])
    end

    it "BROWN: moves pawn 1 step forward" do
      @brown_pawn.position = [7, 1]
      expect(@brown_pawn.move).to eq([6, 1])
    end

    it "can't move when blocked by other piece (opponent or own)" do
      # Create and place a brown_bishop on [4, 1] square
      @brown_bishop.position = [4, 1]
      square = @board.get_square(4, 1)
      square.element = @brown_bishop

      @black_pawn.position = [3, 1]
      expect(@black_pawn.move).to eq([3, 1])
    end
  end

  describe "#start" do
    it "returns starting rank for BLACK piece" do
      expect(@black_pawn.start).to eq(2)
    end

    it "returns starting rank for BROWN piece" do
      expect(@brown_pawn.start).to eq(7)
    end
  end

  describe "#move_two_steps" do
    it "BLACK: moves pawn 2 steps forward, if it's at start; from [2, 1] to [4, 1]" do
      @black_pawn.position = [2, 1]
      expect(@black_pawn.move_two_steps).to eq([4, 1])
    end

    it "BLACK: moves pawn 2 steps forward, if it's at start; from [2, 3] to [4, 3]" do
      @black_pawn.position = [2, 3]
      expect(@black_pawn.move_two_steps).to eq([4, 3])
    end

    it "BLACK: doesn't move if it isn't at start" do
      @black_pawn.position = [3, 4]
      expect(@black_pawn.move_two_steps).to eq([3, 4])
    end

    it "BROWN: moves pawn 2 steps forward, if it's at start; from [7, 3] to [5, 3]" do
      @brown_pawn.position = [7, 3]
      expect(@brown_pawn.move_two_steps).to eq([5, 3])
    end

    it "BROWN: doesn't move if it isn't at start" do
      @brown_pawn.position = [5, 3]
      expect(@brown_pawn.move_two_steps).to eq([5, 3])
    end
  end

  describe "#capture" do
    it "BLACK(RIGHT): captures an opponent brown_bishop (BROWN) piece at [4, 2]" do
      # Create and place a brown_bishop on [4, 1] square
      @brown_bishop.position = [4, 2]
      square = @board.get_square(4, 2)
      square.element = @brown_bishop

      @black_pawn.position = [3, 1]
      expect(@black_pawn.capture).to eq([4, 2])
    end

    it "BLACK(RIGHT): captures an opponent brown_bishop (BROWN) at [5, 7]" do
      # Create and place a brown_bishop on [4, 1] square
      @brown_bishop.position = [5, 7]
      square = @board.get_square(5, 7)
      square.element = @brown_bishop

      @black_pawn.position = [4, 6]
      expect(@black_pawn.capture).to eq([5, 7])
    end

    it "BROWN(RIGHT): captures an opponent bishop (BLACK) at [4, 2]" do
      # Create and place a black bishop on [4, 2]
      @black_bishop.position = [4, 2]
      square = @board.get_square(4, 2)
      square.element = @black_bishop

      @brown_pawn.position = [5, 1]
      expect(@brown_pawn.capture).to eq([4, 2])
    end

    it "BROWN(RIGHT): captures an opponent bishop (BLACK) at [4, 5]" do
      # Create and place a black bishop on [4, 5]
      @black_bishop.position = [4, 5]
      square = @board.get_square(4, 5)
      square.element = @black_bishop

      @brown_pawn.position = [5, 4]
      expect(@brown_pawn.capture).to eq([4, 5])
    end
  end
end
