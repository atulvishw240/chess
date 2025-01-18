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

row_index = 3
col_index = 8
game.board.update(row_index, col_index, rook)

positions = rook.all_possible_moves(row_index, col_index)
game.board.display_markers(positions)
game.board.display
