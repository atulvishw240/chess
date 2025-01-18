require_relative "mod_utils"
require_relative "pieces_set"
# GAME
class Game
  include Utils

  attr_accessor :current_player_id, :board

  def initialize(player1, player2)
    @board = Board.new
    @players = [player1, player2]
    @current_player_id = play_as_white
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

  def play_as_white
    random = rand(0..1)
    self.current_player_id = random
  end

  def setup_board
    brown = SetOfPieces.new(current_player, "\e[38;5;160m")
    black = SetOfPieces.new(opponent, "\e[30m")

    setup_pieces(black.pieces, 8)
    setup_pieces(black.pawns, 7)
    setup_pieces(brown.pieces, 1)
    setup_pieces(brown.pawns, 2)
  end

  def setup_pieces(pieces, at_rank)
    rank = 9 - at_rank
    pieces.each_with_index do |piece, index|
      file = index
      board.update(rank, file, piece)
    end
  end
end
