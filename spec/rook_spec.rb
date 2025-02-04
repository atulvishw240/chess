require_relative "../lib/pieces_set"
require_relative "../pieces/rook"
require_relative "../lib/board"

describe Rook do
  before(:each) do
    @board = Board.new
    @rook = Rook.new("Rook")
    @rook.board = @board
  end

  describe "#all_possible_moves" do
    it "returns all possible moves from [1, 1]" do
      @rook.position = [1, 1]
      possible_moves = [[2, 1], [3, 1], [4, 1], [5, 1], [6, 1], [7, 1], [8, 1], [1, 2], [1, 3], [1, 4],
                        [1, 5], [1, 6], [1, 7], [1, 8]]

      moves = @rook.all_possible_moves
      expect(moves).to eq(possible_moves)
    end

    it "returns all possible moves from [1, 4]" do
      @rook.position = [1, 4]
      possible_moves = [[2, 4], [3, 4], [4, 4], [5, 4], [6, 4], [7, 4], [8, 4], [1, 5], [1, 6], [1, 7], [1, 8],
                        [1, 3], [1, 2], [1, 1]]

      moves = @rook.all_possible_moves
      expect(moves).to eq(possible_moves)
    end

    it "returns all possible moves from [5, 4]" do
      @rook.position = [5, 4]
      possible_moves = [[6, 4], [7, 4], [8, 4], [4, 4], [3, 4], [2, 4], [1, 4], [5, 5], [5, 6], [5, 7], [5, 8],
                        [5, 3], [5, 2], [5, 1]]

      moves = @rook.all_possible_moves
      expect(moves).to eq(possible_moves)
    end
  end
end
