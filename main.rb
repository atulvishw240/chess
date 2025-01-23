require_relative "lib/player"
require_relative "lib/board"
require_relative "lib/game"
require_relative "pieces/rook"

player1 = Player.new("Atul Vishwakarma")
player2 = Player.new("Gaurav Vishwakarma")

game = Game.new(player1, player2)
game.play
