require_relative "../pieces/king"
require_relative "../lib/board"

describe King do
  before(:each) do
    @board = Board.new
    @king = King.new("King")
    @king.board = @board
  end

  describe "#all_possible_moves" do
    it "returns all possible moves from [4, 5]" do
      @king.row = 4
      @king.col = 5

      possible_moves = [[5, 5], [3, 5], [4, 6], [4, 4], [5, 6], [5, 4], [3, 6], [3, 4]]
      moves = @king.all_possible_moves
      expect(moves).to eq(possible_moves)
    end

    it "returns all possible moves from [1, 1]" do
      @king.row = 1
      @king.col = 1

      possible_moves = [[2, 1], [1, 2], [2, 2]]
      moves = @king.all_possible_moves
      expect(moves).to eq(possible_moves)
    end

    it "returns all possible moves from [8, 8]" do
      @king.row = 8
      @king.col = 8

      possible_moves = [[7, 8], [8, 7], [7, 7]]
      moves = @king.all_possible_moves
      expect(moves).to eq(possible_moves)
    end

    it "returns all possible moves from [8, 1]" do
      @king.row = 8
      @king.col = 1

      possible_moves = [[7, 1], [8, 2], [7, 2]]
      moves = @king.all_possible_moves
      expect(moves).to eq(possible_moves)
    end

    it "returns all possible moves from [1, 8]" do
      @king.row = 1
      @king.col = 8

      possible_moves = [[2, 8], [1, 7], [2, 7]]
      moves = @king.all_possible_moves
      expect(moves).to eq(possible_moves)
    end
  end
end
