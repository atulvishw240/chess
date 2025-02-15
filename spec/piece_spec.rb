require_relative "../lib/piece"
require_relative "../lib/board"

describe Piece do
  before(:each) do
    @piece = Piece.new("Black")
    @board = Board.new
    @piece.board = @board
  end

  describe "#move" do
    it "moves the piece to a new position" do
      @piece.position = [3, 3]
      @piece.move([4, 3])
      expect(@piece.position).to eq([4, 3])

      square = @board.get_square(3, 3)
      expect(square.element).to eq(" ")
    end
  end
end
