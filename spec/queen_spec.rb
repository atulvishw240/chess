require_relative "../pieces/queen"

describe Queen do

  before(:each) do
    @queen = Queen.new("Queen")
  end

  describe "#all_possible_moves" do
    it "returns all possible moves from [4, 5]" do
      possible_moves = [[5, 5], [6, 5], [7, 5], [8, 5], [3, 5], [2, 5], [1, 5], # vertical
                        [4, 6], [4, 7], [4, 8], [4, 4], [4, 3], [4, 2], [4, 1], # horizontal
                        [5, 4], [6, 3], [7, 2], [8, 1], [3, 6], [2, 7], [1, 8], # diagonal
                        [5, 6], [6, 7], [7, 8], [3, 4], [2, 3], [1, 2]] # reverse diagonal

      moves = @queen.all_possible_moves(4, 5)
      expect(moves).to eq(possible_moves)
    end
  end
end
