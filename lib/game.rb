require_relative "modules/mod_utils"
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

  def play
    # 1.Set up the Board
    # 2.Assign pieces set to players
    # 3.Player1 will get first turn
    #   3.1 Player1 will select a piece
    #   3.2 He'll be displayed all possible moves for that particular piece
    #   3.3 He'll then select one of the possible move
    #   3.4 The piece will then move to the position selected by player
    # 4.It's Player2 turn (He'll do the same)
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
