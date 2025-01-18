require_relative "../pieces/knight"

describe Knight do

  before(:each) do
    @knight = Knight.new("Knight")
  end

  describe "#all_possible_moves" do
    it "returns all possible moves from [3, 6]" do
      possible_moves = [[5, 7], [5, 5], [1, 7], [1, 5], [4, 8], [2, 8], [4, 4], [2, 4]]

      moves = @knight.all_possible_moves(3, 6)
      expect(moves).to eq(possible_moves)
    end

    it "returns all possible moves from [4, 4]" do
      possible_moves = [[6, 5], [6, 3], [2, 5], [2, 3], [5, 6], [3, 6], [5, 2], [3, 2]]

      moves = @knight.all_possible_moves(4, 4)
      expect(moves).to eq(possible_moves)
    end

    it "returns all possible moves for [5, 2]" do
      possible_moves = [[7, 3], [7, 1], [3, 3], [3, 1], [6, 4], [4, 4]]

      moves = @knight.all_possible_moves(5, 2)
      expect(moves).to eq(possible_moves)
    end

    it "returns all possible moves for [7, 1]" do
      possible_moves = [[5, 2], [8, 3], [6, 3]]

      moves = @knight.all_possible_moves(7, 1)
      expect(moves).to eq(possible_moves)
    end
  end
end
