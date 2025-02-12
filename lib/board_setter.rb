require_relative "modules/mod_colorable"
# Sets the board and updates it when a piece moves or captures
class BoardSetter
  include Colorable

  attr_accessor :board

  def initialize(board, sets)
    @board = board
    @sets = sets
  end

  # Black
  def first
    @sets[0]
  end

  # Brown
  def second
    @sets[1]
  end

  def refresh_board
    update_board_with_pieces(first.set)
    update_board_with_pieces(second.set)
  end

  def setup_board
    update_pieces_start_position(first.set[0..7])
    update_pieces_start_position(second.set[0..7])
    update_pawns_start_position(first.set[8..15])
    update_pawns_start_position(second.set[8..15])

    update_board_with_pieces(first.set)
    update_board_with_pieces(second.set)
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

  def update_pawns_start_position(pawns)
    color = pawns[0].color
    row_index = color == BLACK_FOREGROUND ? 2 : 7

    pawns.each_with_index do |pawn, col_index|
      pawn.position = [row_index, col_index + 1]
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
