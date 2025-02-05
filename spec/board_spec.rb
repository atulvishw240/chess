require_relative "../lib/board"
require_relative "../lib/square"

describe Board do
  before(:each) do
    @board = Board.new
  end

  describe "#display" do
    it "prints the current state of board" do
      $stdout = StringIO.new
      white = "\e[47m"
      cyan = "\e[48;5;45m"
      reset = "\e[0m"
      @board.display
      $stdout.rewind

      rank1 = "\e[1;33m8 \e[0m\e[47m   \e[0m\e[48;5;45m   \e[0m\e[47m   \e[0m\e[48;5;45m   \e[0m\e[47m   \e[0m\e[48;5;45m   \e[0m\e[47m   \e[0m\e[48;5;45m   \e[0m\n"
      rank2 = "\e[1;33m7 \e[0m\e[48;5;45m   \e[0m\e[47m   \e[0m\e[48;5;45m   \e[0m\e[47m   \e[0m\e[48;5;45m   \e[0m\e[47m   \e[0m\e[48;5;45m   \e[0m\e[47m   \e[0m\n"
      rank3 = "\e[1;33m6 \e[0m\e[47m   \e[0m\e[48;5;45m   \e[0m\e[47m   \e[0m\e[48;5;45m   \e[0m\e[47m   \e[0m\e[48;5;45m   \e[0m\e[47m   \e[0m\e[48;5;45m   \e[0m\n"
      rank4 = "\e[1;33m5 \e[0m\e[48;5;45m   \e[0m\e[47m   \e[0m\e[48;5;45m   \e[0m\e[47m   \e[0m\e[48;5;45m   \e[0m\e[47m   \e[0m\e[48;5;45m   \e[0m\e[47m   \e[0m\n"
      rank5 = "\e[1;33m4 \e[0m\e[47m   \e[0m\e[48;5;45m   \e[0m\e[47m   \e[0m\e[48;5;45m   \e[0m\e[47m   \e[0m\e[48;5;45m   \e[0m\e[47m   \e[0m\e[48;5;45m   \e[0m\n"
      rank6 = "\e[1;33m3 \e[0m\e[48;5;45m   \e[0m\e[47m   \e[0m\e[48;5;45m   \e[0m\e[47m   \e[0m\e[48;5;45m   \e[0m\e[47m   \e[0m\e[48;5;45m   \e[0m\e[47m   \e[0m\n"
      rank7 = "\e[1;33m2 \e[0m\e[47m   \e[0m\e[48;5;45m   \e[0m\e[47m   \e[0m\e[48;5;45m   \e[0m\e[47m   \e[0m\e[48;5;45m   \e[0m\e[47m   \e[0m\e[48;5;45m   \e[0m\n"
      rank8 = "\e[1;33m1 \e[0m\e[48;5;45m   \e[0m\e[47m   \e[0m\e[48;5;45m   \e[0m\e[47m   \e[0m\e[48;5;45m   \e[0m\e[47m   \e[0m\e[48;5;45m   \e[0m\e[47m   \e[0m\n"

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
      marker = "\e[90m\u{25CF}"
      @board.update(5, 1, marker)
      @board.display
      $stdout.rewind

      rank1 = "\e[1;33m8 \e[0m\e[47m   \e[0m\e[48;5;45m   \e[0m\e[47m   \e[0m\e[48;5;45m   \e[0m\e[47m   \e[0m\e[48;5;45m   \e[0m\e[47m   \e[0m\e[48;5;45m   \e[0m\n"
      rank2 = "\e[1;33m7 \e[0m\e[48;5;45m   \e[0m\e[47m   \e[0m\e[48;5;45m   \e[0m\e[47m   \e[0m\e[48;5;45m   \e[0m\e[47m   \e[0m\e[48;5;45m   \e[0m\e[47m   \e[0m\n"
      rank3 = "\e[1;33m6 \e[0m\e[47m   \e[0m\e[48;5;45m   \e[0m\e[47m   \e[0m\e[48;5;45m   \e[0m\e[47m   \e[0m\e[48;5;45m   \e[0m\e[47m   \e[0m\e[48;5;45m   \e[0m\n"
      rank4 = "\e[1;33m5 \e[0m\e[48;5;45m   \e[0m\e[47m   \e[0m\e[48;5;45m   \e[0m\e[47m   \e[0m\e[48;5;45m   \e[0m\e[47m   \e[0m\e[48;5;45m   \e[0m\e[47m   \e[0m\n"
      rank5 = "\e[1;33m4 \e[0m\e[47m #{marker} \e[0m\e[48;5;45m   \e[0m\e[47m   \e[0m\e[48;5;45m   \e[0m\e[47m   \e[0m\e[48;5;45m   \e[0m\e[47m   \e[0m\e[48;5;45m   \e[0m\n"
      rank6 = "\e[1;33m3 \e[0m\e[48;5;45m   \e[0m\e[47m   \e[0m\e[48;5;45m   \e[0m\e[47m   \e[0m\e[48;5;45m   \e[0m\e[47m   \e[0m\e[48;5;45m   \e[0m\e[47m   \e[0m\n"
      rank7 = "\e[1;33m2 \e[0m\e[47m   \e[0m\e[48;5;45m   \e[0m\e[47m   \e[0m\e[48;5;45m   \e[0m\e[47m   \e[0m\e[48;5;45m   \e[0m\e[47m   \e[0m\e[48;5;45m   \e[0m\n"
      rank8 = "\e[1;33m1 \e[0m\e[48;5;45m   \e[0m\e[47m   \e[0m\e[48;5;45m   \e[0m\e[47m   \e[0m\e[48;5;45m   \e[0m\e[47m   \e[0m\e[48;5;45m   \e[0m\e[47m   \e[0m\n"

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
