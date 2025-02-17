require_relative "../pieces/knight"
require_relative "../lib/board"
require_relative "../lib/pieces_set"

describe Knight do
  before(:each) do
    @black = SetOfPieces.new("\e[30m")
    @brown = SetOfPieces.new("\e[38;5;160m")
    @board = Board.new(@black, @brown)
    @knight = Knight.new("Knight")
    @knight.board = @board
  end

  describe "#all_possible_moves" do
    it "returns all possible moves from [3, 6]" do
      @knight.position = [3, 6]

      possible_moves = [[5, 7], [5, 5], [1, 7], [1, 5], [4, 8], [2, 8], [4, 4], [2, 4]]
      moves = @knight.all_possible_moves
      expect(moves).to eq(possible_moves)
    end

    it "returns all possible moves for [5, 2]" do
      @knight.position = [5, 2]

      possible_moves = [[7, 3], [7, 1], [3, 3], [3, 1], [6, 4], [4, 4]]
      moves = @knight.all_possible_moves
      expect(moves).to eq(possible_moves)
    end

    it "returns all possible moves for [7, 1]" do
      @knight.position = [7, 1]

      possible_moves = [[5, 2], [8, 3], [6, 3]]
      moves = @knight.all_possible_moves
      expect(moves).to eq(possible_moves)
    end
  end
end
