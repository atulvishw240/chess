require_relative "../pieces/queen"

describe Queen do

  before(:each) do
    @queen = Queen.new("Queen")
  end

  describe "#all_possible_moves" do
    it "returns all possible moves from e4" do
      possible_moves = [["e", 5], ["e", 6], ["e", 7], ["e", 8], ["e", 3], ["e", 2], ["e", 1], # vertical
                        ["f", 4], ["g", 4], ["h", 4], ["d", 4], ["c", 4], ["b", 4], ["a", 4], # horizontal
                        ["d", 5], ["c", 6], ["b", 7], ["a", 8], ["f", 3], ["g", 2], ["h", 1], # diagonal
                        ["f", 5], ["g", 6], ["h", 7], ["d", 3], ["c", 2], ["b", 1]] # reverse diagonal

      moves = @queen.all_possible_moves("e", 4)
      expect(moves).to eq(possible_moves)
    end
  end
end
