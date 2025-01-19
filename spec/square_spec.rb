require_relative "../lib/square"
require_relative "../pieces/rook"

describe Square do

  before(:each) do
    @square = Square.new
    @rook = Rook.new("Rook")
  end

  describe "#contains?" do
    it "returns false when square doesn't contains a piece" do
      result = @square.contains?(@rook)

      expect(result).to eq(false)
    end

    it "returns true when square contains a piece" do
      @square.element = @rook
      result = @square.contains?(@rook)
  
      expect(result).to eq(true)
    end
  end
end
