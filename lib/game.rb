require_relative "board"

# GAME
class Game
  attr_accessor :current_player_id, :board

  def initialize(black, brown, player1, player2)
    @board = Board.new(black, brown)
    @players = [player1, player2]
    @current_player_id = 0
  end

  def play
    assign_pieces_set_to_players
    piece = let_player_select_a_piece
    let_player_make_a_move(piece)
    board.display
  end

  def assign_pieces_set_to_players
    current_player.set_of_pieces = board.brown
    opponent.set_of_pieces = board.black
  end

  def let_player_select_a_piece
    board.display

    selection = current_player.select_piece
    square = board.get_square(selection[0], selection[1])
    piece = square.element
  end

  def let_player_make_a_move(piece)
    # Display possible actions for a piece
    possible_moves = piece.all_possible_moves
    moves = piece.useful_moves
    captures = piece.all_possible_captures(possible_moves)
    piece.display_markers_and_captures(moves, captures)

    # Ask player to select which action he wants to perform
    move = current_player.make_move(moves, captures)
    move_or_capture(piece, move, captures)
  end

  def move_or_capture(piece, move, captures)
    if captures.include?(move)
      row_index = move[0]
      col_index = move[1]
      opponent.set_of_pieces.delete_piece_at(row_index, col_index)
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
