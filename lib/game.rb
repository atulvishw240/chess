require_relative "modules/mod_utils"
require_relative "modules/mod_colorable"

# GAME
class Game
  include Utils
  include Colorable

  attr_accessor :current_player_id, :board

  def initialize(player1, player2)
    @board = Board.new
    @players = [player1, player2]
    @current_player_id = 0
  end

  def play
    assign_pieces_set_to_players
    # 3. Brown Player will always make a first move
    selection = current_player.select_piece
    # 4. Player selects a piece
    square = board.get_square(selection[0], selection[1])
    piece = square.element
    # 5. Player decides the coordinates for this selected piece (capture or simple move)
    possible_moves = piece.all_possible_moves(board)
    moves = piece.useful_moves(board)
    captures = piece.all_possible_captures(board, possible_moves)

    piece.display_possible_actions(board, moves, captures)
    board.display
    piece.clean_markers_and_captures(board, moves, captures)
    # 6. If entered coordinates has a capture then remove the captured piece from the opponent's
    # set of pieces. Update your piece position.
    # 7. For simple move coordinates just update your piece coordinates.
    move = current_player.make_move(moves, captures)

    row_index = move[0]
    col_index = move[1]

    square.element = " "
    piece.update_position(row_index, col_index)
    # 8. Alternate turns between Black and Brown unless game ends in draw or someone eventually wins.

    board.display
  end

  def assign_pieces_set_to_players
    current_player.set_of_pieces = board.brown
    opponent.set_of_pieces = board.black

    board.display
  end

  def capture_at?(move)
    board.captures.include?(move)
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
