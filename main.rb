require_relative "lib/player"
require_relative "lib/pieces_set"
require_relative "lib/board"
require_relative "lib/game"

player1 = Player.new("Atul Vishwakarma", "B")
player2 = Player.new("Gaurav Vishwakarma", "W")

game = Game.new(player1, player2)
game.setup_board
