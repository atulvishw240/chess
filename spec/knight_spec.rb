require_relative "../pieces/knight"
require_relative "../lib/board"

describe Knight do
  before(:each) do
    @board = Board.new
    @knight = Knight.new("Knight")
    @knight.board = @board
  end

  describe "#all_possible_moves" do
    it "returns all possible moves from [3, 6]" do
      @knight.row = 3
      @knight.col = 6

      possible_moves = [[5, 7], [5, 5], [1, 7], [1, 5], [4, 8], [2, 8], [4, 4], [2, 4]]
      moves = @knight.all_possible_moves
      expect(moves).to eq(possible_moves)
    end

    it "returns all possible moves from [4, 4]" do
      @knight.row = 4
      @knight.col = 4

      possible_moves = [[6, 5], [6, 3], [2, 5], [2, 3], [5, 6], [3, 6], [5, 2], [3, 2]]
      moves = @knight.all_possible_moves
      expect(moves).to eq(possible_moves)
    end

    it "returns all possible moves for [5, 2]" do
      @knight.row = 5
      @knight.col = 2

      possible_moves = [[7, 3], [7, 1], [3, 3], [3, 1], [6, 4], [4, 4]]
      moves = @knight.all_possible_moves
      expect(moves).to eq(possible_moves)
    end

    it "returns all possible moves for [7, 1]" do
      @knight.row = 7
      @knight.col = 1

      possible_moves = [[5, 2], [8, 3], [6, 3]]
      moves = @knight.all_possible_moves
      expect(moves).to eq(possible_moves)
    end
  end
end
