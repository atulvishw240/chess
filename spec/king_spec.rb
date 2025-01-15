require_relative "../pieces/king"

describe King do

  before(:each) do
    @king = King.new("King")
  end

  describe "#all_possible_moves" do
    it "returns all possible moves from e4" do
      possible_moves = [["e", 5], ["e", 3], ["f", 4], ["d", 4], ["f", 5], ["d", 5], ["f", 3], ["d", 3]]

      moves = @king.all_possible_moves("e", 4)
      expect(moves).to eq(possible_moves)
    end

    it "returns all possible moves from a1" do
      possible_moves = [["a", 2], ["b", 1], ["b", 2]]

      moves = @king.all_possible_moves("a", 1)
      expect(moves).to eq(possible_moves)
    end

    it "returns all possible moves from h8" do
      possible_moves = [["h", 7], ["g", 8], ["g", 7]]

      moves = @king.all_possible_moves("h", 8)
      expect(moves).to eq(possible_moves)
    end

    it "returns all possible moves from a8" do
      possible_moves = [["a", 7], ["b", 8], ["b", 7]]

      moves = @king.all_possible_moves("a", 8)
      expect(moves).to eq(possible_moves)
    end

    it "returns all possible moves from h1" do
      possible_moves = [["h", 2], ["g", 1], ["g", 2]]

      moves = @king.all_possible_moves("h", 1)
      expect(moves).to eq(possible_moves)
    end
  end
end
