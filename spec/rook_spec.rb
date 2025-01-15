require_relative "../pieces/rook"

describe Rook do

  before(:each) do
    @rook = Rook.new("Rook")
  end

  describe "#all_possible_moves" do
    it "returns all possible moves from a1" do
      possible_moves = [["a", 2], ["a", 3], ["a", 4], ["a", 5], ["a", 6], ["a", 7], ["a", 8],
                        ["b", 1], ["c", 1], ["d", 1], ["e", 1], ["f", 1], ["g", 1], ["h", 1]]

      moves = @rook.all_possible_moves("a", 1)
      expect(moves).to eq(possible_moves)
    end

    it "returns all possible moves from d1" do
      possible_moves = [["d", 2], ["d", 3], ["d", 4], ["d", 5], ["d", 6], ["d", 7], ["d", 8],
                        ["c", 1], ["b", 1], ["a", 1], ["e", 1], ["f", 1], ["g", 1], ["h", 1]]

      moves = @rook.all_possible_moves("d", 1)
      expect(moves).to eq(possible_moves)
    end

    it "returns all possible moves from d8" do
      possible_moves = [["d", 7], ["d", 6], ["d", 5], ["d", 4], ["d", 3], ["d", 2], ["d", 1],
                        ["c", 8], ["b", 8], ["a", 8], ["e", 8], ["f", 8], ["g", 8], ["h", 8]]

      moves = @rook.all_possible_moves("d", 8)
      expect(moves).to eq(possible_moves)
    end

    it "returns all possible moves from d5" do
      possible_moves = [["d", 6], ["d", 7], ["d", 8], ["d", 4], ["d", 3], ["d", 2], ["d", 1],
                        ["c", 5], ["b", 5], ["a", 5], ["e", 5], ["f", 5], ["g", 5], ["h", 5]]

      moves = @rook.all_possible_moves("d", 5)
      expect(moves).to eq(possible_moves)
    end

    it "returns all possible moves from a8" do
      possible_moves = [["a", 7], ["a", 6], ["a", 5], ["a", 4], ["a", 3], ["a", 2], ["a", 1],
                        ["b", 8], ["c", 8], ["d", 8], ["e", 8], ["f", 8], ["g", 8], ["h", 8]]

      moves = @rook.all_possible_moves("a", 8)
      expect(moves).to eq(possible_moves)
    end
  end
end
