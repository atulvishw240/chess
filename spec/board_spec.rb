require_relative "../lib/board"
require_relative "../lib/square"

describe Board do
  before(:each) do
    @board = Board.new
    @board.board[3][3] = @square
  end

  describe "#update" do
    it "updates the board with either a piece or a marker" do
      marker = "\e[90m\u{25CF}"
      @board.update(3, 4, marker)
      square = @board.get_square(3, 4)

      expect(marker).to eq(square.element)
    end
  end

  describe "#get_square" do
    it "returns the square at row_index & col_index" do
      got_square = @board.get_square(3, 3)

      expect(got_square).to eq(@square)
    end
  end
end
