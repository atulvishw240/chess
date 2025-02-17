require_relative "../lib/piece"
require_relative "../lib/board"
require_relative "../lib/pieces_set"

describe Piece do
  before(:each) do
    @black = SetOfPieces.new("\e[30m")
    @brown = SetOfPieces.new("\e[38;5;160m")
    @piece = Piece.new("Black")
    @board = Board.new(@black, @brown)
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
