require_relative "board"
require_relative "modules/mod_colorable"

# GAME
class Game
  include Colorable

  attr_accessor :current_player_id, :board

  def initialize(black, brown, player1, player2)
    @board = Board.new
    @players = [player1, player2]
    @current_player_id = 0

    setup_board(black, brown)
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
end
