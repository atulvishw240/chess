require_relative "../pieces/king"

describe King do

  before(:each) do
    @king = King.new("King")
  end

  describe "#all_possible_moves" do
    it "returns all possible moves from e4" do
      possible_moves = [[5, 5], [3, 5], [4, 6], [4, 4], [5, 6], [5, 4], [3, 6], [3, 4]]

      moves = @king.all_possible_moves(4, 5)
      expect(moves).to eq(possible_moves)
    end

    it "returns all possible moves from a1" do
      possible_moves = [[2, 1], [1, 2], [2, 2]]

      moves = @king.all_possible_moves(1, 1)
      expect(moves).to eq(possible_moves)
    end

    it "returns all possible moves from h8" do
      possible_moves = [[7, 8], [8, 7], [7, 7]]

      moves = @king.all_possible_moves(8, 8)
      expect(moves).to eq(possible_moves)
    end

    it "returns all possible moves from a8" do
      possible_moves = [[7, 1], [8, 2], [7, 2]]

      moves = @king.all_possible_moves(8, 1)
      expect(moves).to eq(possible_moves)
    end

    it "returns all possible moves from h1" do
      possible_moves = [[2, 8], [1, 7], [2, 7]]

      moves = @king.all_possible_moves(1, 8)
      expect(moves).to eq(possible_moves)
    end
  end
end
