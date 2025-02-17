require_relative "../pieces/king"
require_relative "../lib/board"
require_relative "../lib/pieces_set"

describe King do
  before(:each) do
    @black = SetOfPieces.new("\e[30m")
    @brown = SetOfPieces.new("\e[38;5;160m")
    @board = Board.new(@black, @brown)
    @king = King.new("King")
    @king.board = @board
  end

  describe "#all_possible_moves" do
    it "returns all possible moves from [4, 5]" do
      @king.position = [4, 5]

      possible_moves = [[5, 4], [5, 5], [5, 6], [3, 4], [3, 5], [3, 6], [4, 6], [4, 4]]
      moves = @king.all_possible_moves
      expect(moves).to eq(possible_moves)
    end

    it "returns all possible moves from [1, 1]" do
      @king.position = [1, 1]

      possible_moves = [[2, 1], [2, 2], [1, 2]]
      moves = @king.all_possible_moves
      expect(moves).to eq(possible_moves)
    end

    it "returns all possible moves from [8, 8]" do
      @king.position = [8, 8]

      possible_moves = [[7, 7], [7, 8], [8, 7]]
      moves = @king.all_possible_moves
      expect(moves).to eq(possible_moves)
    end
  end
end
