require_relative "lib/player"
require_relative "lib/pieces_set"
require_relative "lib/game"
require_relative "lib/board"

BLACK_FOREGROUND = "\e[30m".freeze
BROWN_FOREGROUND = "\e[38;5;160m".freeze

player1 = Player.new("Atul Vishwakarma")
player2 = Player.new("Gaurav Vishwakarma")

black = SetOfPieces.new(BLACK_FOREGROUND)
brown = SetOfPieces.new(BROWN_FOREGROUND)
board = Board.new(black, brown)
game = Game.new(board, player1, player2)

game.play
