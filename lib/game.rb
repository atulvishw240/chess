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
    assign_pieces_set_to_players

    loop do
      board.display

      piece = current_player.select_piece
      moves = piece.possible_actions
      move = current_player.make_move(moves)
      move_handler(move, piece)

      board.refresh
      board.display
      switch_players!
    end
  end

  def assign_pieces_set_to_players
    board.setup
    opponent.set_of_pieces = board.black # black
    current_player.set_of_pieces = board.brown # brown
  end

  def move_handler(move, piece)
    square = board.get_square(move[0], move[1])

    if square.contains_piece?
      opp_piece = square.element
      opponent.set_of_pieces.delete_piece(opp_piece)
    end

    piece.move(move)
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
