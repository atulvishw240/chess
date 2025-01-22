require_relative "mod_utils"
require_relative "pieces_set"
# GAME
class Game
  include Utils

  attr_accessor :current_player_id, :board

  def initialize(player1, player2)
    @board = Board.new
    @players = [player1, player2]
    @current_player_id = 0
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

  def play
    board.setup_board
    at_position = current_player.select_piece
    square = board.get_square(at_position[0], at_position[1])
    piece = square.element
    puts piece
  end

  # def play_as_white
  #   random = rand(0..1)
  #   self.current_player_id = random
  # end
end
