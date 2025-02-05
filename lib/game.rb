require_relative "board"
require_relative "modules/mod_colorable"

# GAME
class Game
  include Colorable

  attr_accessor :current_player_id, :board, :current_player_set

  def initialize(black, brown, player1, player2)
    @board = Board.new
    @players = [player1, player2]
    @sets = [black, brown]

    @current_player_id = 0
    @current_player_set = 0

    setup_board(black, brown)
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
  end

  def setup_board(black, brown)
    update_pieces_start_position(black.set[0..7])
    update_pieces_start_position(brown.set[0..7])

    update_board_with_pieces(black.set[0..7])
    update_board_with_pieces(brown.set[0..7])
  end

  def update_pieces_start_position(pieces)
    color = pieces[0].color
    row_index = color == BLACK_FOREGROUND ? 1 : 8

    pieces.each_with_index do |piece, col_index|
      piece.position = [row_index, col_index + 1] # To offset against 1th index based Board
    end
  end

  def update_board_with_pieces(pieces)
    pieces.each do |piece|
      row_index = piece.position[0]
      col_index = piece.position[1]
      piece.board = board

      board.update(row_index, col_index, piece)
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

  def current_set
    @sets[current_player_id]
  end

  def opponent_set
    @sets[1 - current_player_id]
  end
end
