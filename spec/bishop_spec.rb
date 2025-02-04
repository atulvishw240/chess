require_relative "../pieces/bishop"
require_relative "../lib/board"
require_relative "../lib/modules/mod_colorable"

describe Bishop do
  before(:each) do
    @board = Board.new
    @bishop = Bishop.new("Bishop")
    @bishop.board = @board
  end

  describe "#all_possible_moves" do
    it "returns all possible moves from [1, 1]" do
      @bishop.position = [1, 1]

      possible_moves = [[2, 2], [3, 3], [4, 4], [5, 5], [6, 6], [7, 7], [8, 8]]
      moves = @bishop.all_possible_moves
      expect(moves).to eq(possible_moves)
    end

    it "returns all possible moves from [1, 4]" do
      @bishop.position = [1, 4]

      possible_moves = [[2, 5], [3, 6], [4, 7], [5, 8], [2, 3], [3, 2], [4, 1]]
      moves = @bishop.all_possible_moves

      expect(moves).to eq(possible_moves)
    end

    it "returns all possible moves from [8, 4]" do
      @bishop.position = [8, 4]

      possible_moves = [[7, 3], [6, 2], [5, 1], [7, 5], [6, 6], [5, 7], [4, 8]]
      moves = @bishop.all_possible_moves

      expect(moves).to eq(possible_moves)
    end

    it "returns all possible moves from [4, 5]" do
      @bishop.position = [4, 5]

      possible_moves = [[3, 4], [2, 3], [1, 2], [5, 6], [6, 7], [7, 8], [3, 6],
                        [2, 7], [1, 8], [5, 4], [6, 3], [7, 2], [8, 1]]
      moves = @bishop.all_possible_moves

      expect(moves).to eq(possible_moves)
    end
  end
end
