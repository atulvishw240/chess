require_relative "../pieces/queen"
require_relative "../lib/board"
require_relative "../lib/pieces_set"

describe Queen do
  before(:each) do
    @black = SetOfPieces.new("\e[30m")
    @brown = SetOfPieces.new("\e[38;5;160m")
    @board = Board.new(@black, @brown)
    @queen = Queen.new("Queen")
    @queen.board = @board
  end

  describe "#all_possible_moves" do
    it "returns all possible moves from [4, 5]" do
      @queen.position = [4, 5]

      possible_moves = [[5, 5], [6, 5], [7, 5], [8, 5], [3, 5], [2, 5], [1, 5], [4, 6], [4, 7], [4, 8], [4, 4], [4, 3],
                        [4, 2], [4, 1], [3, 4], [2, 3], [1, 2], [5, 6], [6, 7], [7, 8], [3, 6], [2, 7], [1, 8], [5, 4],
                        [6, 3], [7, 2], [8, 1]]

      moves = @queen.all_possible_moves
      expect(moves).to eq(possible_moves)
    end
  end
end
