require_relative "modules/mod_utils"

# PLAYER
class Player
  include Utils

  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def select_piece
    puts "Enter the coordinates of a piece in the format [e4 i.e. file followed by rank & without space]: "
    coordinates = gets.chomp.chars

    return convert_to_indices(coordinates) if valid?(coordinates)

    puts "Error, Try again!!"
    puts "\n"
    select_piece
  end

  def pieces(set)
    set.each_with_index do |piece, index|
      next if index.zero?

      piece.player = self
    end
  end

  private

  def convert_to_indices(coordinates)
    row_index = coordinates[1].to_i
    col_index = file_to_int(coordinates[0])

    [row_index, col_index]
  end

  def valid?(coordinates)
    return false unless coordinates.length == 2

    file = coordinates[0]
    rank = coordinates[1].to_i

    true if file.between?("a", "h") && rank.between?(1, 8)
  end
end
