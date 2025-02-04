require_relative "../lib/square"
require_relative "../pieces/rook"

describe Square do
  before(:each) do
    @square = Square.new
    @rook = Rook.new("/e[47m")
  end

  describe "#contains_piece?" do
    it "returns false when square doesn't contains a piece" do
      result = @square.contains_piece?

      expect(result).to eq(false)
    end

    it "returns true when square contains a piece" do
      @square.element = @rook
      result = @square.contains_piece?

      expect(result).to eq(true)
    end
  end

  describe "#to_s" do
    it "returns empty string when square doesn't contain a piece" do
      result = @square.to_s

      expect(result).to eq(" ")
    end

    it "returns piece unicode as a string when square contains a piece" do
      @square.element = @rook
      result = @square.to_s

      expect(result).to eq("/e[47m\u{265C}")
    end
  end
end
