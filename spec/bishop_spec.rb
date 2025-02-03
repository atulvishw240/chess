require_relative "../lib/pieces_set"
require_relative "../pieces/bishop"
require_relative "../lib/board"
require_relative "../lib/modules/mod_colorable"

describe Bishop do
  before(:each) do
    @black = SetOfPieces.new("\e[30m")
    @brown = SetOfPieces.new("\e[38;5;160m")
    @board = Board.new(@black, @brown)
    @bishop = Bishop.new("Bishop")
    @bishop.board = @board
  end

  describe "#all_possible_moves" do
    it "returns all possible moves from [1, 1]" do
      @bishop.row = 1
      @bishop.col = 1

      possible_moves = [[2, 2], [3, 3], [4, 4], [5, 5], [6, 6], [7, 7], [8, 8]]
      moves = @bishop.all_possible_moves
      expect(moves).to eq(possible_moves)
    end

    it "returns all possible moves from [1, 4]" do
      @bishop.row = 1
      @bishop.col = 4

      possible_moves = [[2, 5], [3, 6], [4, 7], [5, 8], [2, 3], [3, 2], [4, 1]]
      moves = @bishop.all_possible_moves

      expect(moves).to eq(possible_moves)
    end

    it "returns all possible moves from [8, 4]" do
      @bishop.row = 8
      @bishop.col = 4

      possible_moves = [[7, 5], [6, 6], [5, 7], [4, 8], [7, 3], [6, 2], [5, 1]]
      moves = @bishop.all_possible_moves

      expect(moves).to eq(possible_moves)
    end

    it "returns all possible moves from [4, 5]" do
      @bishop.row = 4
      @bishop.col = 5

      possible_moves = [[5, 6], [6, 7], [7, 8], [5, 4], [6, 3], [7, 2], [8, 1], [3, 6],
                        [2, 7], [1, 8], [3, 4], [2, 3], [1, 2]]
      moves = @bishop.all_possible_moves

      expect(moves).to eq(possible_moves)
    end
  end
end
