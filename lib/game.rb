require_relative "board"
require_relative "modules/mod_colorable"
require_relative "board_setter"

# GAME
class Game
  include Colorable

  attr_accessor :current_player_id, :board, :current_player_set, :setter_or_refresher

  def initialize(board, players, sets)
    @board = board
    @players = players
    @sets = sets
    @setter_or_refresher = BoardSetter.new(board, sets)

    @current_player_id = 0
    @current_player_set = 0

    @setter_or_refresher.setup_board
  end

  def play
    current_player.set_of_pieces = current_set
    opponent.set_of_pieces = opponent_set

    board.display
    select = current_player.select_piece
    square = board.get_square(select[0], select[1])

    piece = square.element
    moves = piece.all_possible_moves
    captures = piece.all_possible_captures(moves)
    piece.display_markers_and_captures(moves, captures)
    move = current_player.make_move(moves, captures)

    piece.move(move)
    setter_or_refresher.refresh_board
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

  def current_set
    @sets[current_player_id]
  end

  def opponent_set
    @sets[1 - current_player_id]
  end
end
