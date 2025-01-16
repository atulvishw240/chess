require_relative "lib/player"
require_relative "lib/pieces_set"
require_relative "lib/board"

player1 = Player.new("Atul Vishwakarma", "B")
player2 = Player.new("Gaurav Vishwakarma", "W")
black_pieces = SetOfPieces.new(player1, "\e[30m")
white_pieces = SetOfPieces.new(player2, "\e[37m")

board = Board.new(white_pieces, black_pieces)
board.print_board
