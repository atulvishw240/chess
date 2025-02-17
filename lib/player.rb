require_relative "modules/mod_utils"

# PLAYER
class Player
  include Utils

  attr_accessor :name, :set_of_pieces

  def initialize(name)
    @name = name
  end

  def select_piece
    options = set_of_pieces.all_possible_selections
    puts "Enter the coordinates of a piece in the format [e4 i.e. file followed by rank & without space]: "
    input = gets.chomp.chars
    coordinates = convert_to_indices(input) if valid_coordinates?(input)

    return set_of_pieces.piece_at(coordinates) if options.include?(coordinates)

    display_error_message
    select_piece
  end

  def make_move(moves, captures)
    puts "Enter the coordinates, where you would like your piece to move [Like d6]: "
    input = gets.chomp.chars
    move = convert_to_indices(input) if valid_coordinates?(input)

    return move if valid_move?(move, moves, captures)

    display_error_message
    make_move(moves, captures)
  end

  #----------------------------------------ALL PRIVATE METHODS ARE BELOW-------------------------------------------
  private

  def valid_coordinates?(coordinates)
    return false unless coordinates.length == 2

    file = coordinates[0]
    rank = coordinates[1].to_i

    true if file.between?("a", "h") && rank.between?(1, 8)
  end

  def valid_move?(move, moves, captures)
    moves.include?(move) || captures.include?(move)
  end

  def display_error_message
    puts "Entered Invalid coordinates, Please Try again!!"
    puts "\n"
  end

  def convert_to_indices(coordinates)
    col_index = file_to_int(coordinates[0])
    row_index = coordinates[1].to_i
    row_index = 9 - row_index # To offset ranks starting from 8

    [row_index, col_index]
  end
end
