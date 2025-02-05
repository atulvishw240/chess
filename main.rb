require_relative "lib/player"
require_relative "lib/pieces_set"
require_relative "lib/game"
require_relative "lib/board"

BLACK_FOREGROUND = "\e[30m".freeze
BROWN_FOREGROUND = "\e[38;5;160m".freeze

player1 = Player.new("Atul Vishwakarma")
player2 = Player.new("Gaurav Vishwakarma")
players = [player1, player2]

black = SetOfPieces.new(BLACK_FOREGROUND)
brown = SetOfPieces.new(BROWN_FOREGROUND)
sets = [black, brown]

board = Board.new
game = Game.new(board, players, sets)

game.play
