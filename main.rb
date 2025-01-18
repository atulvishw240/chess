require_relative "lib/player"
require_relative "lib/pieces_set"
require_relative "lib/board"
require_relative "lib/game"
require_relative "pieces/rook"

player1 = Player.new("Atul Vishwakarma", "B")
player2 = Player.new("Gaurav Vishwakarma", "W")

game = Game.new(player1, player2)
# game.setup_board
color = "\e[30m"
rook = Rook.new("#{color}♜")

game.board.update(4, 5, rook)
game.board.display

positions = rook.all_possible_moves(4, 5)
game.board.display_markers(positions)
game.board.display
