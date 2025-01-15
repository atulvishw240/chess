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
  end
end
