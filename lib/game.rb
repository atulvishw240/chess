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
    # 1. Assign pieces to Players (Black or Brown)
    # 2. Display Board
    # 3. Brown Player will always make a first move
    # 4. Player selects a piece
    # 5. Player decides the coordinates for this selected piece (capture or simple move)
    # 6. If entered coordinates has a capture then remove the captured piece from the opponent's
    # set of pieces. Update your piece position.
    # 7. For simple move coordinates just update your piece coordinates.
    # 8. Alternate turns between Black and Brown unless game ends in draw or someone eventually wins.
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
