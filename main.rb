require_relative "lib/player"
require_relative "lib/pieces_set"
require_relative "lib/board"
require_relative "lib/game"
require_relative "pieces/rook"

player1 = Player.new("Atul Vishwakarma", "B")
player2 = Player.new("Gaurav Vishwakarma", "W")

game = Game.new(player1, player2)
# game.setup_board
# game.board.display
# color = "\e[30m"
# rook = Rook.new("#{color}♜")

# color = "\e[31m"
# rook2 = Rook.new("#{color}♜")

# row_index = 3
# col_index = 5
# game.board.update(row_index, col_index, rook)
# game.board.update(7, 5, rook2)

# positions = rook.all_possible_moves(game.board, row_index, col_index)
# p positions
# game.board.markers(positions)
# game.board.display

board = Board.new
board.setup_board
board.display
