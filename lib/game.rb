require_relative "modules/mod_utils"

# GAME
class Game
  include Utils

  attr_accessor :current_player_id, :board

  def initialize(player1, player2)
    @board = Board.new
    @players = [player1, player2]
    @current_player_id = 0
  end

  def play
    selection = current_player.select_piece
    row_index = selection[0]
    col_index = selection[1]

    square = board.get_square(row_index, col_index)
    piece = square.element

    possible_moves = piece.all_possible_moves(board, row_index, col_index)
    p "Possible moves: #{possible_moves}"

    board.markers = possible_moves
    possible_captures = piece.all_possible_captures(board, possible_moves)
    puts "Possible captures: #{possible_captures}"

    board.captures = possible_captures
    board.display
  end

  def current_player
    @players[current_player_id]
  end

  def opponent
    @players[1 - current_player_id]
  end

  def switch_players!
    @current_player_id = 1 - @current_player_id
  end
end
