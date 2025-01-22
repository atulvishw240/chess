require_relative "lib/player"
require_relative "lib/pieces_set"
require_relative "lib/board"
require_relative "lib/game"
require_relative "pieces/rook"

# player1 = Player.new("Atul Vishwakarma")
# player2 = Player.new("Gaurav Vishwakarma")

# game = Game.new(player1, player2)
# game.play

board = Board.new
color = "\e[30m"
rook = Rook.new("#{color}♜")

row_index = 8
col_index = 8

board.update(row_index, col_index, rook)
positions = rook.all_possible_moves(board, row_index, col_index)
board.display_markers(positions)
