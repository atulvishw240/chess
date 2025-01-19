require_relative "../lib/board"
require_relative "../lib/square"

describe Board do

  before(:each) do
    @board = Board.new
    @square = Square.new
    @board.board[3][3] = @square
  end

  describe "#get_square" do
    it "returns the square at row_index & col_index" do
      got_square = @board.get_square(3, 3)

      expect(got_square).to eq(@square)
    end
  end

  describe "#sum" do
    it "returns sum of row and col index" do
      sum = @board.sum(3, 5)

      expect(sum).to eq(8)
    end
  end
end
