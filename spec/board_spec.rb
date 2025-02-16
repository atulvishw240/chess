require_relative "../lib/board"
require_relative "../lib/pieces_set"
require_relative "../lib/square"

describe Board do
  before(:each) do
    @black_set = SetOfPieces.new("\e[30m")
    @brown_set = SetOfPieces.new("\e[38;5;160m")
    @board = Board.new(@black_set, @brown_set)
  end

  describe "#display" do
    it "prints the current state of board" do
      $stdout = StringIO.new
      @board.display
      $stdout.rewind

      yellow = "\e[1;33m"
      reset = "\e[0m"
      white = "\e[47m"
      cyan = "\e[48;5;45m"

      rank1 = "#{yellow}8 #{reset}#{white}   #{reset}#{cyan}   #{reset}#{white}   #{reset}#{cyan}   #{reset}#{white}   #{reset}#{cyan}   #{reset}#{white}   #{reset}#{cyan}   #{reset}\n"
      rank2 = "#{yellow}7 #{reset}#{cyan}   #{reset}#{white}   #{reset}#{cyan}   #{reset}#{white}   #{reset}#{cyan}   #{reset}#{white}   #{reset}#{cyan}   #{reset}#{white}   #{reset}\n"
      rank3 = "#{yellow}6 #{reset}#{white}   #{reset}#{cyan}   #{reset}#{white}   #{reset}#{cyan}   #{reset}#{white}   #{reset}#{cyan}   #{reset}#{white}   #{reset}#{cyan}   #{reset}\n"
      rank4 = "#{yellow}5 #{reset}#{cyan}   #{reset}#{white}   #{reset}#{cyan}   #{reset}#{white}   #{reset}#{cyan}   #{reset}#{white}   #{reset}#{cyan}   #{reset}#{white}   #{reset}\n"
      rank5 = "#{yellow}4 #{reset}#{white}   #{reset}#{cyan}   #{reset}#{white}   #{reset}#{cyan}   #{reset}#{white}   #{reset}#{cyan}   #{reset}#{white}   #{reset}#{cyan}   #{reset}\n"
      rank6 = "#{yellow}3 #{reset}#{cyan}   #{reset}#{white}   #{reset}#{cyan}   #{reset}#{white}   #{reset}#{cyan}   #{reset}#{white}   #{reset}#{cyan}   #{reset}#{white}   #{reset}\n"
      rank7 = "#{yellow}2 #{reset}#{white}   #{reset}#{cyan}   #{reset}#{white}   #{reset}#{cyan}   #{reset}#{white}   #{reset}#{cyan}   #{reset}#{white}   #{reset}#{cyan}   #{reset}\n"
      rank8 = "#{yellow}1 #{reset}#{cyan}   #{reset}#{white}   #{reset}#{cyan}   #{reset}#{white}   #{reset}#{cyan}   #{reset}#{white}   #{reset}#{cyan}   #{reset}#{white}   #{reset}\n"

      expect($stdout.gets).to eq(rank1)
      expect($stdout.gets).to eq(rank2)
      expect($stdout.gets).to eq(rank3)
      expect($stdout.gets).to eq(rank4)
      expect($stdout.gets).to eq(rank5)
      expect($stdout.gets).to eq(rank6)
      expect($stdout.gets).to eq(rank7)
      expect($stdout.gets).to eq(rank8)
    end
  end

  describe "#update" do
    it "updates the board with either a piece or a marker" do
      $stdout = StringIO.new
      yellow = "\e[1;33m"
      reset = "\e[0m"
      white = "\e[47m"
      cyan = "\e[48;5;45m"
      marker = "\e[90m\u{25CF}"
      @board.update(5, 1, marker)
      @board.display
      $stdout.rewind

      rank1 = "#{yellow}8 #{reset}#{white}   #{reset}#{cyan}   #{reset}#{white}   #{reset}#{cyan}   #{reset}#{white}   #{reset}#{cyan}   #{reset}#{white}   #{reset}#{cyan}   #{reset}\n"
      rank2 = "#{yellow}7 #{reset}#{cyan}   #{reset}#{white}   #{reset}#{cyan}   #{reset}#{white}   #{reset}#{cyan}   #{reset}#{white}   #{reset}#{cyan}   #{reset}#{white}   #{reset}\n"
      rank3 = "#{yellow}6 #{reset}#{white}   #{reset}#{cyan}   #{reset}#{white}   #{reset}#{cyan}   #{reset}#{white}   #{reset}#{cyan}   #{reset}#{white}   #{reset}#{cyan}   #{reset}\n"
      rank4 = "#{yellow}5 #{reset}#{cyan}   #{reset}#{white}   #{reset}#{cyan}   #{reset}#{white}   #{reset}#{cyan}   #{reset}#{white}   #{reset}#{cyan}   #{reset}#{white}   #{reset}\n"
      rank5 = "#{yellow}4 #{reset}#{white} #{marker} #{reset}#{cyan}   #{reset}#{white}   #{reset}#{cyan}   #{reset}#{white}   #{reset}#{cyan}   #{reset}#{white}   #{reset}#{cyan}   #{reset}\n"
      rank6 = "#{yellow}3 #{reset}#{cyan}   #{reset}#{white}   #{reset}#{cyan}   #{reset}#{white}   #{reset}#{cyan}   #{reset}#{white}   #{reset}#{cyan}   #{reset}#{white}   #{reset}\n"
      rank7 = "#{yellow}2 #{reset}#{white}   #{reset}#{cyan}   #{reset}#{white}   #{reset}#{cyan}   #{reset}#{white}   #{reset}#{cyan}   #{reset}#{white}   #{reset}#{cyan}   #{reset}\n"
      rank8 = "#{yellow}1 #{reset}#{cyan}   #{reset}#{white}   #{reset}#{cyan}   #{reset}#{white}   #{reset}#{cyan}   #{reset}#{white}   #{reset}#{cyan}   #{reset}#{white}   #{reset}\n"

      expect($stdout.gets).to eq(rank1)
      expect($stdout.gets).to eq(rank2)
      expect($stdout.gets).to eq(rank3)
      expect($stdout.gets).to eq(rank4)
      expect($stdout.gets).to eq(rank5)
      expect($stdout.gets).to eq(rank6)
      expect($stdout.gets).to eq(rank7)
      expect($stdout.gets).to eq(rank8)
    end
  end
end
