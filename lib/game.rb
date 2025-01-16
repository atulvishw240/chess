require_relative "pieces_set"
# GAME
class Game
  attr_accessor :current_player_id

  def initialize(player1, player2)
    @board = Board.new
    @players = [player1, player2]
    @current_player_id = 0
  end

  def current_player
    @players[current_player_id]
  end

  def switch_players!
    @current_player_id = 1 - @current_player_id
  end
end
