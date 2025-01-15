require_relative "../pieces/knight"

describe Knight do

  before(:each) do
    @knight = Knight.new("Knight")
  end

  describe "#all_possible_moves" do
    it "returns all possible moves from f3" do
      possible_moves = [["g", 5], ["e", 5], ["g", 1], ["e", 1], ["h", 4], ["h", 2], ["d", 4], ["d", 2]]

      moves = @knight.all_possible_moves("f", 3)
      expect(moves).to eq(possible_moves)
    end

    it "returns all possible moves from d4" do
      possible_moves = [["e", 6], ["c", 6], ["e", 2], ["c", 2], ["f", 5], ["f", 3], ["b", 5], ["b", 3]]

      moves = @knight.all_possible_moves("d", 4)
      expect(moves).to eq(possible_moves)
    end
  end
end
