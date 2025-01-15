require_relative "../pieces/bishop"

describe Bishop do

  before(:each) do
    @bishop = Bishop.new("Bishop")
  end

  describe "#all_possible_moves" do
    it "returns all possible moves from a1" do
      possible_moves = [["b", 2], ["c", 3], ["d", 4], ["e", 5], ["f", 6], ["g", 7], ["h", 8]]
      moves = @bishop.all_possible_moves("a", 1)

      expect(moves).to eq(possible_moves)
    end

    it "returns all possible moves from d1" do
      possible_moves = [["e", 2], ["f", 3], ["g", 4], ["h", 5], ["c", 2], ["b", 3], ["a", 4]]
      moves = @bishop.all_possible_moves("d", 1)

      expect(moves).to eq(possible_moves)
    end

    it "returns all possible moves from d8" do
      possible_moves = [["e", 7], ["f", 6], ["g", 5], ["h", 4], ["c", 7], ["b", 6], ["a", 5]]

      moves = @bishop.all_possible_moves("d", 8)
      expect(moves).to eq(possible_moves)
    end

    it "returns all possible moves from e4" do
      possible_moves = [["f", 5], ["g", 6], ["h", 7], ["d", 5], ["c", 6], ["b", 7], ["a", 8], ["f", 3], ["g", 2],
                        ["h", 1], ["d", 3], ["c", 2], ["b", 1]]

      moves = @bishop.all_possible_moves("e", 4)
      expect(moves).to eq(possible_moves)
    end
  end
end
