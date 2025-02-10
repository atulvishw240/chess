require "pry-byebug"
require_relative "../pieces/pawn"
require_relative "../pieces/bishop"
require_relative "../lib/board"

describe Pawn do # rubocop:disable Metrics/BlockLength
  before(:each) do
    # Colors
    brown = "\e[38;5;160m"
    black = "\e[30m"

    @board = Board.new

    # Black pawn
    @black_pawn = Pawn.new(black)
    @black_pawn.board = @board

    # Brown pawn
    @brown_pawn = Pawn.new(brown)
    @brown_pawn.board = @board

    # Brown bishop
    @brown_bishop = Bishop.new(brown)
    @brown_bishop.board = @board
    @brown_bishop2 = Bishop.new(brown)
    @brown_bishop2.board = @board

    # Black bishop
    @black_bishop = Bishop.new(black)
    @black_bishop.board = @board
    @black_bishop2 = Bishop.new(black)
    @black_bishop2.board = @board
  end

  describe "#one_step" do
    it "BLACK: moves pawn 1 step forward" do
      @black_pawn.position = [2, 1]
      expect(@black_pawn.one_step(2, 1)).to eq([3, 1])
    end

    it "BROWN: moves pawn 1 step forward" do
      @brown_pawn.position = [7, 1]
      expect(@brown_pawn.one_step(7, 1)).to eq([6, 1])
    end

    it "can't move when blocked by other piece (opponent or own)" do
      # Create and place a brown_bishop on [4, 1] square
      @brown_bishop.position = [4, 1]
      square = @board.get_square(4, 1)
      square.element = @brown_bishop

      @black_pawn.position = [3, 1]
      expect(@black_pawn.one_step(3, 1)).to eq([])
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

  describe "#two_steps" do
    it "BLACK: moves pawn 2 steps forward, if it's at start; from [2, 1] to [4, 1]" do
      @black_pawn.position = [2, 1]
      expect(@black_pawn.two_steps(2, 1)).to eq([[3, 1], [4, 1]])
    end

    it "BLACK: moves pawn 2 steps forward, if it's at start; from [2, 3] to [4, 3]" do
      @black_pawn.position = [2, 3]
      expect(@black_pawn.two_steps(2, 3)).to eq([[3, 3], [4, 3]])
    end

    it "BLACK: doesn't move if it isn't at start" do
      @black_pawn.position = [3, 4]
      expect(@black_pawn.two_steps(3, 4)).to eq([])
    end

    it "BROWN: moves pawn 2 steps forward, if it's at start; from [7, 3] to [5, 3]" do
      @brown_pawn.position = [7, 3]
      expect(@brown_pawn.two_steps(7, 3)).to eq([[6, 3], [5, 3]])
    end

    it "BROWN: doesn't move if it isn't at start" do
      @brown_pawn.position = [5, 3]
      expect(@brown_pawn.two_steps(5, 3)).to eq([])
    end
  end

  describe "#capture" do
    it "BLACK(RIGHT): captures an opponent brown_bishop (BROWN) piece at [4, 2]" do
      # Create and place a brown_bishop on [4, 1] square
      @brown_bishop.position = [4, 2]
      square = @board.get_square(4, 2)
      square.element = @brown_bishop

      @black_pawn.position = [3, 1]
      expect(@black_pawn.capture(3, 1)).to eq([[4, 2]])
    end

    it "BLACK(RIGHT): captures an opponent brown_bishop (BROWN) at [5, 7]" do
      # Create and place a brown_bishop on [4, 1] square
      @brown_bishop.position = [5, 7]
      square = @board.get_square(5, 7)
      square.element = @brown_bishop

      @black_pawn.position = [4, 6]
      expect(@black_pawn.capture(4, 6)).to eq([[5, 7]])
    end

    it "BLACK(LEFT): captures an opponent bishop (BROWN) at [4, 1]" do
      # Create and place a brown_bishop on [4, 1] square
      @brown_bishop.position = [4, 1]
      square = @board.get_square(4, 1)
      square.element = @brown_bishop

      @black_pawn.position = [3, 2]
      expect(@black_pawn.capture(3, 2)).to eq([[4, 1]])
    end

    it "BLACK(LEFT): captures an opponent bishop (BROWN) at [5, 3]" do
      # Create and place a brown_bishop on [4, 1] square
      @brown_bishop.position = [5, 3]
      square = @board.get_square(5, 3)
      square.element = @brown_bishop

      @black_pawn.position = [4, 4]
      expect(@black_pawn.capture(4, 4)).to eq([[5, 3]])
    end

    it "BLACK(DOUBLE): captures opponent's bishops (BROWN) at [5, 1] and [5, 3]" do
      # Create and place brown bishops on [5, 1] and [5, 3]
      @brown_bishop.position = [5, 1]
      square = @board.get_square(5, 1)
      square.element = @brown_bishop

      @brown_bishop2.position = [5, 3]
      square = @board.get_square(5, 3)
      square.element = @brown_bishop2

      @black_pawn.position = [4, 2]
      # binding.pry
      expect(@black_pawn.capture(4, 2)).to eq([[5, 3], [5, 1]])
    end

    it "BROWN(RIGHT): captures an opponent bishop (BLACK) at [4, 2]" do
      # Create and place a black bishop on [4, 2]
      @black_bishop.position = [4, 2]
      square = @board.get_square(4, 2)
      square.element = @black_bishop

      @brown_pawn.position = [5, 1]
      expect(@brown_pawn.capture(5, 1)).to eq([[4, 2]])
    end

    it "BROWN(RIGHT): captures an opponent bishop (BLACK) at [4, 5]" do
      # Create and place a black bishop on [4, 5]
      @black_bishop.position = [4, 5]
      square = @board.get_square(4, 5)
      square.element = @black_bishop

      @brown_pawn.position = [5, 4]
      expect(@brown_pawn.capture(5, 4)).to eq([[4, 5]])
    end

    it "BROWN(LEFT): captures an opponent bishop (BLACK) at [4, 5]" do
      @black_bishop.position = [4, 5]
      square = @board.get_square(4, 5)
      square.element = @black_bishop

      @brown_pawn.position = [5, 6]
      expect(@brown_pawn.capture(5, 6)).to eq([[4, 5]])
    end

    it "BROWN(LEFT): captures an opponent bishop (BLACK) at [4, 2]" do
      @black_bishop.position = [4, 2]
      square = @board.get_square(4, 2)
      square.element = @black_bishop

      @brown_pawn.position = [5, 3]
      expect(@brown_pawn.capture(5, 3)).to eq([[4, 2]])
    end

    it "BROWN(DOUBLE): captures opponent's bishops (BLACK) at [5, 1] and [5, 3]" do
      # Create and place brown bishops on [5, 1] and [5, 3]
      @black_bishop.position = [5, 1]
      square = @board.get_square(5, 1)
      square.element = @black_bishop

      @black_bishop2.position = [5, 3]
      square = @board.get_square(5, 3)
      square.element = @black_bishop2

      @brown_pawn.position = [6, 2]
      # binding.pry
      expect(@brown_pawn.capture(6, 2)).to eq([[5, 3], [5, 1]])
    end
  end

  describe "#all_possible_moves" do
    it "returns all possible moves for a black pawn at [2, 1]" do
      @black_pawn.position = [2, 1]
      expect(@black_pawn.all_possible_moves).to eq([[3, 1], [4, 1]])
    end

    it "returns all possible moves for a brown pawn at [7, 1]" do
      @brown_pawn.position = [7, 1]
      expect(@brown_pawn.all_possible_moves).to eq([[6, 1], [5, 1]])
    end
  end
end
