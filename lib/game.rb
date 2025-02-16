require_relative "board"
require_relative "modules/mod_colorable"

# GAME
class Game
  include Colorable

  attr_accessor :current_player_id, :board

  def initialize(board, player1, player2)
    @board = board
    @players = [player1, player2]
    @current_player_id = 0
  end

  def play
    board.setup

    opponent.set_of_pieces = board.black # black
    current_player.set_of_pieces = board.brown # brown

    loop do
      board.display

      # Player selects a piece
      select = current_player.select_piece
      square = board.get_square(select[0], select[1])
      piece = square.element

      # Player makes a move
      moves = piece.all_possible_moves
      captures = piece.all_possible_captures(moves)
      piece.display_markers_and_captures(moves, captures)
      move = current_player.make_move(moves, captures)

      # Move the piece or capture opponent's pieces with it
      if captures.include?(move)
        piece.move(move)
        opponent.set_of_pieces.delete_piece_at(move)
      else
        piece.move(move)
      end

      board.refresh
      board.display
      switch_players!
    end
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
