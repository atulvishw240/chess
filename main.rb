require_relative "lib/player"
require_relative "lib/pieces_set"
require_relative "lib/game"

player1 = Player.new("Atul Vishwakarma")
player2 = Player.new("Gaurav Vishwakarma")
BLACK_FOREGROUND = "\e[30m".freeze
BROWN_FOREGROUND = "\e[38;5;160m".freeze

black = SetOfPieces.new(BLACK_FOREGROUND)
brown = SetOfPieces.new(BROWN_FOREGROUND)

game = Game.new(black, brown, player1, player2)
game.board.display
