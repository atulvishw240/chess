require_relative "../pieces/rook"
require_relative "../lib/board"

describe Rook do
  before(:each) do
    color = "\e[30m"
    @rook = Rook.new("#{color}♜")
    @board = Board.new
  end

  describe "#all_possible_moves" do
    it "returns all possible moves from [1, 1]" do
      @board.update(1, 1, @rook)
      possible_moves = [[2, 1], [3, 1], [4, 1], [5, 1], [6, 1], [7, 1], [8, 1], [1, 2], [1, 3], [1, 4],
                        [1, 5], [1, 6], [1, 7], [1, 8]]

      moves = @rook.all_possible_moves(@board, 1, 1)
      expect(moves).to eq(possible_moves)
    end

    it "returns all possible moves from [1, 4]" do
      @board.update(1, 4, @rook)
      possible_moves = [[2, 4], [3, 4], [4, 4], [5, 4], [6, 4], [7, 4], [8, 4], [1, 3], [1, 2],
                        [1, 1], [1, 5], [1, 6], [1, 7], [1, 8]]

      moves = @rook.all_possible_moves(@board, 1, 4)
      expect(moves).to eq(possible_moves)
    end

    it "returns all possible moves from [8, 4]" do
      @board.update(8, 4, @rook)
      possible_moves = [[7, 4], [6, 4], [5, 4], [4, 4], [3, 4], [2, 4], [1, 4], [8, 3], [8, 2],
                        [8, 1], [8, 5], [8, 6], [8, 7], [8, 8]]

      moves = @rook.all_possible_moves(@board, 8, 4)
      expect(moves).to eq(possible_moves)
    end

    it "returns all possible moves from [5, 4]" do
      @board.update(5, 4, @rook)
      possible_moves = [[6, 4], [7, 4], [8, 4], [4, 4], [3, 4], [2, 4], [1, 4], [5, 3], [5, 2],
                        [5, 1], [5, 5], [5, 6], [5, 7], [5, 8]]

      moves = @rook.all_possible_moves(@board, 5, 4)
      expect(moves).to eq(possible_moves)
    end

    it "returns all possible moves from [8, 1]" do
      @board.update(8, 1, @rook)
      possible_moves = [[7, 1], [6, 1], [5, 1], [4, 1], [3, 1], [2, 1], [1, 1], [8, 2], [8, 3],
                        [8, 4], [8, 5], [8, 6], [8, 7], [8, 8]]

      moves = @rook.all_possible_moves(@board, 8, 1)
      expect(moves).to eq(possible_moves)
    end
  end

  describe "#all_possible_moves for possible captures" do
    it "returns all possible moves for [4, 5] and a capture at [7, 5]" do
      color = "\e[38;5;160m"
      rook2 = Rook.new("#{color}♜")
      @board.update(4, 5, @rook)
      @board.update(7, 5, rook2)

      possible_moves = [[5, 5], [6, 5], [7, 5], [3, 5], [2, 5], [1, 5], [4, 4], [4, 3], [4, 2],
                        [4, 1], [4, 6], [4, 7], [4, 8]]

      moves = @rook.all_possible_moves(@board, 4, 5)
      expect(moves).to eq(possible_moves)
    end
  end
end
