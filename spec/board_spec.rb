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

  describe "#sum" do
    it "returns sum of row and col index" do
      sum = @board.sum(3, 5)

      expect(sum).to eq(8)
    end
  end

  describe "#assign_color_to_square" do
    it "assigns a color to a square, if it doesn't already have a color" do
      white = "\e[47m"
      square = @board.get_square(3, 5)
      @board.assign_color_to_square(square, 8)

      expect(square.color).to eq(white)
    end

    it "assigns a cyan color to square, if the sum of its coordinates is odd" do
      cyan = "\e[48;5;45m"
      square = @board.get_square(4, 5)
      @board.assign_color_to_square(square, 9)

      expect(square.color).to eq(cyan)
    end

    it "doesn't assign a color to a square if it already has a color" do
      yellow = "\e[1;33m"
      square = @board.get_square(5, 5)
      square.color = yellow
      @board.assign_color_to_square(square, 10)

      expect(square.color).to eq(yellow)
    end
  end
end
