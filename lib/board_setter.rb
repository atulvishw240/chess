require_relative "modules/mod_colorable"
# Sets the board and updates it when a piece moves or captures
class BoardSetter
  include Colorable

  attr_accessor :board

  def initialize(board, sets)
    @board = board
    @sets = sets
  end

  def first
    @sets[0]
  end

  def second
    @sets[1]
  end

  def refresh_board
    update_board_with_pieces(first.set[0..7])
    update_board_with_pieces(second.set[0..7])
  end

  def setup_board
    update_pieces_start_position(first.set[0..7])
    update_pieces_start_position(second.set[0..7])

    update_board_with_pieces(first.set[0..7])
    update_board_with_pieces(second.set[0..7])
  end

  #-----------------------------ALL PRIVATE METHODS BELOW------------------------------------------
  private

  # Only required once at start
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
end
