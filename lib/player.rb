require_relative "modules/mod_utils"

# PLAYER
class Player
  include Utils

  attr_accessor :name, :color

  def initialize(name)
    @name = name
  end

  def select_piece
    puts "Enter the coordinates of a piece in the format [e4 i.e. file followed by rank & without space]: "
    coordinates = gets.chomp.chars

    return convert_to_indices(coordinates) if valid_coordinates?(coordinates)

    display_error_message
    select_piece
  end

  def select_move(possible_moves)
    puts "Enter the coordinates where you would like to move your selected piece to [Like d6]: "
    move = gets.chomp.chars

    return convert_to_indices(move) if valid_move?(move, possible_moves)

    display_error_message
    select_move
  end

  #----------------------------------------ALL PRIVATE METHODS ARE BELOW-------------------------------------------
  private

  def valid_coordinates?(coordinates)
    return false unless coordinates.length == 2

    file = coordinates[0]
    rank = coordinates[1].to_i

    true if file.between?("a", "h") && rank.between?(1, 8)
  end

  def valid_move?(move, possible_moves)
    valid_coords = valid_coordinates?(move)
    valid_move = possible_moves.include?(move)

    valid_coords && valid_move
  end

  def display_error_message
    puts "Entered Invalid coordinates, Please Try again!!"
    puts "\n"
  end

  def convert_to_indices(coordinates)
    col_index = file_to_int(coordinates[0])
    row_index = coordinates[1].to_i

    [row_index, col_index]
  end
end
