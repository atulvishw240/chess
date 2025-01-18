require_relative "../pieces/bishop"

describe Bishop do
  before(:each) do
    @bishop = Bishop.new("Bishop")
  end

  describe "#all_possible_moves" do
    it "returns all possible moves from a1" do
      possible_moves = [[2, 2], [3, 3], [4, 4], [5, 5], [6, 6], [7, 7], [8, 8]]
      moves = @bishop.all_possible_moves(1, 1)

      expect(moves).to eq(possible_moves)
    end

    it "returns all possible moves from d1" do
      possible_moves = [[2, 5], [3, 6], [4, 7], [5, 8], [2, 3], [3, 2], [4, 1]]
      moves = @bishop.all_possible_moves(1, 4)

      expect(moves).to eq(possible_moves)
    end

    it "returns all possible moves from d8" do
      possible_moves = [[7, 5], [6, 6], [5, 7], [4, 8], [7, 3], [6, 2], [5, 1]]

      moves = @bishop.all_possible_moves(8, 4)
      expect(moves).to eq(possible_moves)
    end

    it "returns all possible moves from e4" do
      possible_moves = [[5, 6], [6, 7], [7, 8], [5, 4], [6, 3], [7, 2], [8, 1], [3, 6],
                        [2, 7], [1, 8], [3, 4], [2, 3], [1, 2]]

      moves = @bishop.all_possible_moves(4, 5)
      expect(moves).to eq(possible_moves)
    end
  end
end
